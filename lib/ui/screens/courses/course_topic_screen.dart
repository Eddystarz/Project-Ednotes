import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edtech/core/models/course.dart';
import 'package:edtech/ui/screens/courses/courses_screen/video_note_screen.dart';
import 'package:edtech/ui/screens/courses/read_note_screen.dart';
import 'package:edtech/ui/widgets/toastshow.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class CourseTopicScreen extends StatefulWidget {
  final CourseTopics? courseTopic;

  const CourseTopicScreen({Key? key, this.courseTopic}) : super(key: key);
  @override
  _CourseTopicScreenState createState() => _CourseTopicScreenState();
}

class _CourseTopicScreenState extends State<CourseTopicScreen> {
  bool downloading = false;
  bool _isBusy = false;
  var progressString = "";
  double downloadPercent = 0.0;

  Future<bool> checkForFile(String fileName, String mimeType) async{
    //var  = Provider.of<LiteratureProvider>(context, listen: false).selectedLibraryLiterature;
    print(fileName);


    // get book file name
    var dir = await getApplicationDocumentsDirectory();
    var bookDir = mimeType == "pdf" ? ".notes" : ".videos";
    return await File('${dir.path}/${bookDir}/${fileName}').exists();

  }

  Future<void> downloadFile(String inputPath, String outputPath) async {
    print(inputPath);
    print(outputPath);

    showSuccessToast("Please wait while we set things up...");

    setState(() {
      downloadPercent = 0.0;
      downloading = true;
    });

    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(
          inputPath,
          outputPath,
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              downloadPercent = (rec/total).toPrecision(2);
              print(downloadPercent);
              progressString = "${rec/1000}kb";
            });
          });
    } catch (e) {
      showErrorToast("Error getting this lesson note");
      downloading = false;
      setState(() {});
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  Widget courseTopicContainer(LectureNotes ln, int selectedIndex){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: Get.width,
          padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${ln.name}'.capitalize!,
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600,),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text('${ln.text}'.capitalize!,
                    style: GoogleFonts.poppins(fontSize: 16),
                  )
                ],
              ),

              SizedBox(height: 10,),
              Divider(
                color: Colors.grey,
              ),

              Text("Attachments",
                style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),),


              Column(
                children: List.generate(ln.noteAttachments!.length, (i) {
                  var lni = ln.noteAttachments![i];
                  return ListTile(
                    onTap: () async{
                      var dir = await getApplicationDocumentsDirectory();
                      var tempDir = await getTemporaryDirectory();
                      print("temp Dir: " + tempDir.path);

                      // check if this file is already present in this device
                      // build filename
                      var splitted = lni.fileName!.split(".");
                      String realFileName = splitted[0] + ".aes";

                      print(splitted);
                      print("realFilename: " + realFileName);

                      bool isPresent = await checkForFile(realFileName, lni.mimeType!);

                      print("is realFileName present: ${isPresent}");

                      if(isPresent){
                        _isBusy = true;
                        setState(() {});

                        // file is present, decrypt according to mimetype
                        if(lni.mimeType == "pdf"){
                          String decRealFileName = realFileName.split(".")[0] + ".pdf";
                          var encInputFilePath = "${dir.path}/.notes/${realFileName}";
                          var decOutputFilePath = "${tempDir.path}/${decRealFileName}";
                          print("file to be decryted and it is present: ${encInputFilePath}");
                          decryptFile(
                              encInputFilePath,
                              decOutputFilePath
                          )
                          .then((decFile) {
                            if(decFile != null){
                              print("Cached File path: ${decOutputFilePath}");
                              _isBusy = false;
                              setState(() {});

                              Get.to(() => ReadNoteScreen(
                                useNetwork: false,
                                filePath: decOutputFilePath,
                              ));
                            }
                          });
                        }
                        else if(lni.mimeType == "video"){
                          String decRealFileName = realFileName.split(".")[0] + ".mp4";
                          var encInputFilePath = "${dir.path}/.videos/${realFileName}";
                          var decOutputFilePath = "${tempDir.path}/${decRealFileName}";
                          decryptFile(
                              encInputFilePath,
                              decOutputFilePath
                          )
                              .then((decFile) {
                              if(decFile != null){
                                _isBusy = false;
                                setState(() {});

                                Get.to(() => VideoNoteScreen(
                                  filePath: decOutputFilePath,
                                ));
                              }
                          });
                        }
                      }
                      else {
                        // file is not present, proceed to download
                        var fileOutPath = "${dir.path}/${lni.mimeType == "pdf" ? ".notes" : ".videos"}/${lni.fileName}";
                        print("where is the filePath of future downloaded file: " + fileOutPath);
                        downloadFile(
                          lni.url!,
                          fileOutPath
                        )
                        .then((value) async{
                          var suppodedDownloadFileName = basename(fileOutPath);
                          var exist = await checkForFile(suppodedDownloadFileName, lni.mimeType!);
                          print("is dwonload file present: ${exist}");
                          print("what is the supposed downloaded filePath: " + suppodedDownloadFileName);

                          if(exist){
                            // after downloading, proceed to encrypt
                            if(lni.mimeType == "pdf"){ // encrypt pdf
                              // initialize encrypte file path
                              var fileNameWithoutExtension = basenameWithoutExtension(fileOutPath);
                              var encOutputFilePath = "${dir.path}/.notes/${fileNameWithoutExtension}.aes";
                              print("file to be encryted: ${fileNameWithoutExtension}");
                              encryptFile(
                                  fileOutPath,
                                  encOutputFilePath
                              ).then((encFile) {
                                if(encFile != null){
                                  print("encrypted file path: ${encFile.path}");
                                  // delete the original unencrypted file
                                  File(fileOutPath).exists()
                                      .then((value) async{
                                        if(value){
                                          await File(fileOutPath).delete(recursive: true);
                                        }

                                        print("is fileOutPath still present: ${await File(fileOutPath).exists()}");
                                  });

                                  // open file here
                                  String decRealFileName = basenameWithoutExtension(encFile.path) + ".pdf";
                                  var decOutputFilePath = "${tempDir.path}/${decRealFileName}";
                                  decryptFile(
                                      encFile.path,
                                      decOutputFilePath
                                  )
                                  .then((decFile) {
                                    if(decFile != null){
                                      _isBusy = false;
                                      setState(() {});

                                      Get.to(() => ReadNoteScreen(
                                        useNetwork: false,
                                        filePath: decOutputFilePath,
                                      ));
                                    }
                                  });


                                }
                              });

                            }
                            else if(lni.mimeType == "video"){
                              // initialize encrypte file path
                              var fileNameWithoutExtension = basenameWithoutExtension(fileOutPath);
                              var encOutputFilePath = "${dir.path}/.videos/${fileNameWithoutExtension}.aes";
                              encryptFile(
                                  fileOutPath,
                                  encOutputFilePath
                              ).then((encFile) {
                                if(encFile != null){
                                  // delete the original unencrypted file
                                  File(fileOutPath).exists()
                                      .then((value) async{
                                    if(value){
                                      await File(fileOutPath).delete(recursive: true);
                                    }
                                  });

                                  // open video file here
                                  String decRealFileName = basenameWithoutExtension(encFile.path) + ".mp4";
                                  var decOutputFilePath = "${tempDir.path}/${decRealFileName}";
                                  decryptFile(
                                      encFile.path,
                                      decOutputFilePath
                                  )
                                      .then((decFile) {
                                    if(decFile != null){
                                      _isBusy = false;
                                      setState(() {});

                                      Get.to(() => VideoNoteScreen(
                                        filePath: decOutputFilePath,
                                      ));


                                    }
                                  });



                                }
                              });
                            }

                          }
                          else{ // file does not esit
                            print("downloaded file not found");
                          }
                        });
                      }

                      //Get.to(() => VideoNoteScreen());

                    },
                    leading: Icon(lni.mimeType == "video" ? Icons.tv_rounded : Icons.note),
                    title: Text("Uploaded"),
                    subtitle: Text("${Jiffy(lni.dateUploaded).yMMMdjm}"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  );
                }),
              ),



            ],
          )
      ),
    );
  }

  Future<File> encryptFile(String inputFilePath, String outputFilePath) async {
    File inFile = File(inputFilePath);
    File outFile = new File(outputFilePath);

    bool outFileExists = await outFile.exists();

    if(!outFileExists){
      await outFile.create();
    }

    final fileContents = await inFile.readAsStringSync(encoding: latin1);

    final key = enc.Key.fromUtf8(dotenv.env['ENCKEY']!);
    final iv = enc.IV.fromLength(16);

    final encrypter = enc.Encrypter(enc.AES(key));

    final encrypted = encrypter.encrypt(fileContents, iv: iv);
    return await outFile.writeAsBytes(encrypted.bytes);
  }

  Future<File> decryptFile(String inputFilePath, String outputFilePath) async {
    File inFile = File(inputFilePath);//new File("videoenc.aes"); // encrypted file
    File outFile = File(outputFilePath);//new File("videodec.mp4"); // the real file

    bool outFileExists = await outFile.exists();

    if(!outFileExists){
      await outFile.create();
    }

    final fileContents = await inFile.readAsBytesSync();

    final key = enc.Key.fromUtf8(dotenv.env['ENCKEY']!);
    final iv = enc.IV.fromLength(16);

    final encrypter = enc.Encrypter(enc.AES(key));

    final encryptedFile = enc.Encrypted(fileContents);
    final decrypted = encrypter.decrypt(encryptedFile, iv: iv);

    final decryptedBytes = latin1.encode(decrypted);
    return await outFile.writeAsBytes(decryptedBytes);

  }

  @override
  Widget build(BuildContext context) {
    //var course = Provider.of<CourseProvider>(context, listen:false).selectedCourse;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              downloading
              ? LinearPercentIndicator(
                //width: 500,
                //percent: downloadPercent,
                animation: true,
                animationDuration: 1000,
                lineHeight: 10.0,
                //center: Text("${progressString}"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.black,
              )
              : Container(),
              Text('${widget.courseTopic!.name}'.capitalize!,
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Lecture Notes',
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800),
                  ),

                ],
              ),

              downloading || _isBusy
                  ? Center(child: CircularProgressIndicator.adaptive(backgroundColor: Colors.black,))
                  : Column(
                children: List.generate(widget.courseTopic!.lectureNotes!.length, (i) {
                  var ct = widget.courseTopic!.lectureNotes![i];// course.courseTopics![i];
                  return courseTopicContainer(ct, i);
                }),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
