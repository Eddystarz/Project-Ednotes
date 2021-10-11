import 'dart:io';

import 'package:edtech/ui/screens/courses/ttsprovider.dart';
import 'package:edtech/ui/widgets/setlanguagemodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
//import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:pdf_text/pdf_text.dart';


class ReadNoteScreen extends StatefulWidget {
  bool? useNetwork;
  String? fileUrl;
  String? filePath;

  ReadNoteScreen({this.useNetwork, this.fileUrl, this.filePath});

  @override
  _ReadNoteScreenState createState() => _ReadNoteScreenState();
}

class _ReadNoteScreenState extends State<ReadNoteScreen> {
  PdfViewerController? _pdfViewerController;
  late PDFDoc doc;
  late String docText;
  late int numPages;

  @override
  void initState() {
    diableScreenShots();
    _pdfViewerController = PdfViewerController();
    initPDFText();
    super.initState();
  }

  initPDFText() async{

    doc = await PDFDoc.fromPath(widget.filePath!);
    docText = await doc.text;
    numPages = doc.length;
    print("pages: ${numPages}");
    print(docText);
    Provider.of<TTSProvider>(context, listen: false).setTextToSpeak(docText);

  }


  @override
  void dispose() {
    deleteCachedFiles();

    super.dispose();
  }

  diableScreenShots() async{
    await FlutterWindowManager.addFlags(
       FlutterWindowManager.FLAG_SECURE);
  }

  deleteCachedFiles() async {
    await FlutterWindowManager.clearFlags(
       FlutterWindowManager.FLAG_SECURE);
    doc.deleteFile();
    //await File("/data/user/0/com.example.edtech/app_flutter/.notes/lorem-ipsum.aes").delete();
    File(widget.filePath!).exists()
        .then((value) async{
          if(value){
            File(widget.filePath!).delete(recursive: true)
                .then((fse) {
                  print(fse.path);
            });
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Color(0xFFF9F9F9),
              elevation: 0,
              actions: [
                Provider.of<TTSProvider>(context, listen: true).isPlaying == true && Platform.isIOS
                    ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      Provider.of<TTSProvider>(context, listen: false).paused();
                    },
                    child: Icon(Icons.pause, color: Colors.red,),
                  ),
                )
                    : Container(),

                Provider.of<TTSProvider>(context, listen: true).isPaused == true && Platform.isIOS
                    ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      Provider.of<TTSProvider>(context, listen: false).paused();
                    },
                    child: Icon(Icons.play_arrow_sharp, color: Colors.green,),
                  ),
                )
                    : Container(),

                Provider.of<TTSProvider>(context, listen: true).isPlaying == true
                    ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      Provider.of<TTSProvider>(context, listen: false).stop();
                    },
                    child: Icon(Icons.stop, color: Colors.red,),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      Provider.of<TTSProvider>(context, listen: false).speak(speakDouble: true);
                    },
                    child: Icon(Icons.record_voice_over_rounded, color: Colors.black,),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: (){
                      //Provider.of<TTSProvider>(context, listen: false).speak();
                      showDialog(
                          context: context,
                          builder: (context){
                            return SetLanguageDialog();
                          }
                      );

                    },
                    child: Icon(Icons.more_vert_rounded, color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),
          body: widget.useNetwork!
              ? SfPdfViewer.network(widget.fileUrl!)
              : SfPdfViewer.file(
                  File(widget.filePath!),
                  controller: _pdfViewerController,
                  enableTextSelection: false,
                  onPageChanged: (pcd) async{
                    var ttsProvider = Provider.of<TTSProvider>(context, listen: false);

                    PDFPage page = doc.pageAt(pcd.newPageNumber);
                    if(page != null){
                      String pageText = await page.text;
                      // since this is a new page, switch off tts if on
                      if(ttsProvider.isPlaying!){
                        ttsProvider.stop();
                      }
                      // set tts text to the new page string
                      ttsProvider.setTextToSpeak(pageText);
                      ttsProvider.speak(speakDouble: true);
                    }
                  },
              )
      ),
    );
  }
}
