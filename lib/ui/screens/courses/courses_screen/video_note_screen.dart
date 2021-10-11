import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
//import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:video_player/video_player.dart';

class VideoNoteScreen extends StatefulWidget {
  final String? filePath;

  const VideoNoteScreen({Key? key, this.filePath}) : super(key: key);
  @override
  _VideoNoteScreenState createState() => _VideoNoteScreenState();
}

class _VideoNoteScreenState extends State<VideoNoteScreen> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;


  @override
  void initState() {
    initVideo();
    super.initState();
  }

  initVideo() async {
    diableScreenShots();
    videoPlayerController = VideoPlayerController.file(
        File(widget.filePath!)
    );

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
    await videoPlayerController!.initialize();
  }


  diableScreenShots() async{
    await FlutterWindowManager.addFlags(
       FlutterWindowManager.FLAG_SECURE);
  }

  deleteCachedFiles() async {
    await FlutterWindowManager.clearFlags(
        FlutterWindowManager.FLAG_SECURE);
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
  void dispose() {
    deleteCachedFiles();
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chewie(
        controller: chewieController!,
      )
    );
  }
}
