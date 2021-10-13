import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';



class TTSProvider with ChangeNotifier {
  FlutterTts _flutterTts = FlutterTts(); // initate flutterTTS. We are using Provider here so as to do this once
  String? _textToSpeak = ""; // variable to hold text to speak
  String? _titleTextToSpeak = ""; // variable to hold title text. Some screens have title text to be read
  //bool _ttsState  = TtsState.stopped;
  dynamic _languages; // variable to hold languages available on the device
  String? _language; // variable to the selected language
  double? _volume = 0.5; // voice volume
  double? _pitch = 1.0; // voice pitch
  double? _rate = 0.5; // voice rate

  bool? _isPlaying = false; // is playing flag
  bool? _isStopped = true; // is stopped flag. starts as true since TTS is not on
  bool? _isPaused = false; // is pause flag. only available on IOS
  bool? _isContinued = false; // is continued flag. only available on IOS

  int? start = 0;
  int? _end = 0;

  int? get end => _end;
  bool? get isPlaying => _isPlaying;
  bool? get isStopped => _isStopped;
  bool? get isPaused => _isPaused;
  bool? get isContinued => _isContinued;

  String? get textToSpeak => _textToSpeak;
  String? get titleTextToSpeak => _titleTextToSpeak;
  FlutterTts get flutterTts => _flutterTts;

  //TtsState? get ttsState => _ttsState;
  dynamic get languages => _languages;
  String? get language => _language;
  double? get volume => _volume;
  double? get pitch => _pitch;
  double? get rate => _rate;

  /// initatize TTSProvider with the needed functions and variables
  TTSProvider() {
    setupIOSTTS();
    setupTTSHandlers();
  }

  /// setup platform handlers
  setupTTSHandlers(){
    flutterTts.setStartHandler(() {
      _isPlaying = true;
      _isPaused = false;
      _isStopped = false;
      _isContinued = false;
      notifyListeners();
    });

    flutterTts.setCompletionHandler(() {
      _isPlaying = false;
      _isPaused = false;
      _isStopped = true;
      _isContinued = false;
      notifyListeners();
    });

    flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
      _end = endOffset;
      notifyListeners();
      print(text.length);
      //print(startOffset);
      print(endOffset);
      //print(word);
    });



    flutterTts.setErrorHandler((msg) {
      _isPlaying =false;
      _isPaused = false;
      _isStopped = true;
      _isContinued = false;
      notifyListeners();
    });

    flutterTts.setCancelHandler(() {
      _isPlaying = false;
      _isPaused = false;
      _isStopped = true;
      _isContinued = false;
      notifyListeners();
    });

    if(Platform.isIOS){
      // iOS and Web
      flutterTts.setPauseHandler(() {
        _isPlaying = false;
        _isPaused = true;
        _isStopped = false;
        _isContinued = false;
        notifyListeners();
      });

      flutterTts.setContinueHandler(() {
        _isPlaying = false;
        _isPaused = false;
        _isStopped = false;
        _isContinued = true;
        notifyListeners();
      });
    }
  }

  Future _getLanguages() async {
    _languages = await flutterTts.getLanguages;
    print(flutterTts.getLanguages.runtimeType);
    print("pritty print ${languages}");
    notifyListeners();
   // if (languages != null) setState(() => languages);
  }

  void setSelectedLanguage(String selectedType) {
    if(selectedType != null){
      _language = selectedType;
      _flutterTts.setLanguage(_language!);
    }

  }

  setupIOSTTS() async{
    await _flutterTts.awaitSpeakCompletion(true);
    _getLanguages();
    if(Platform.isIOS){
      await _flutterTts.setSharedInstance(true);
      await _flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback, [
        IosTextToSpeechAudioCategoryOptions.allowBluetooth,
        IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
        IosTextToSpeechAudioCategoryOptions.allowAirPlay,
        IosTextToSpeechAudioCategoryOptions.defaultToSpeaker,
        IosTextToSpeechAudioCategoryOptions.duckOthers
      ]);
    }
  }

  setTextToSpeak(String text){
    _textToSpeak = text;
    notifyListeners();
  }

  setTitleTextToSpeak(String text){
    _titleTextToSpeak = text;
    notifyListeners();
  }

  Future<dynamic> speak({bool? speakDouble = false}) async{
    //print(textToSpeak);
    if(speakDouble == true){
      var result = await _flutterTts.speak(_titleTextToSpeak!);
      print(result);
      if(result == 1){
        //_ttsState = TtsState.playing;
      }
      notifyListeners();
      result = await _flutterTts.speak(_textToSpeak!);
      print(result);
      if(result == 1){
        //_ttsState = TtsState.playing;
      }
      notifyListeners();
    }else{
      var result = await _flutterTts.speak(_textToSpeak!);
      print(result);
      if(result == 1){
        //_ttsState = TtsState.playing;
      }
      notifyListeners();
    }

   // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future<dynamic> stop() async{
    var result = await flutterTts.stop();
    if(result == 1){
      //_ttsState = TtsState.stopped;
    }
    notifyListeners();
    //if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  /// this option is only available to IOS and web.
  /// do not call on Android platform
  Future<dynamic> paused() async{
    var result = await flutterTts.pause();
    if(result == 1){
      //_ttsState = TtsState.paused;
    }
    //if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  setVolume(double value){
    _volume = value;
    _flutterTts.setVolume(_volume!);
    notifyListeners();
  }

  setRate(double value){
    _rate = value;
    _flutterTts.setSpeechRate(_rate!);
    notifyListeners();
  }

  setPitch(double value){
    _pitch = value;
    _flutterTts.setPitch(_pitch!);
    notifyListeners();
  }

  /// some notable languages should be displayed in full
  /// others can be abbreviated
  /// if you need to add more languages to this group, add a new block for it
  String resolveLanguageToFull(String langToParse){
    String result = "";
    switch(langToParse) {
      case "en-US": {
        result = "American English";
      }
      break;

      case "ca": {
        result = "Canadian";
      }
      break;

      case "en-NG": {
        result = "Nigerian English";
      }
      break;

      case "en-GB": {
        result = "British English";
      }
      break;

      case "en-NZ": {
        result = "New Zealand English";
      }
      break;

      case "fr-FR": {
        result = "French";
      }
      break;

      case "es-ES": {
        result = "Spanish";
      }
      break;

      case "de-DE": {
        result = "German";
      }
      break;

      case "pt-PT": {
        result = "Portuguese";
      }
      break;

      case "en-CA": {
        result = "Canadian English";
      }
      break;

      default: {
        result = langToParse;
      }
      break;
    }
    return result;
  }

  /// some notable languages displayed in full have to be returned to abbreviation
  /// if you need to add more languages to this group, add a new block for it
  String resolveLanguageToAbbr(String langToParse){
    String result = "";
    switch(langToParse) {
      case "American English": {
        result = "en-US";
      }
      break;

      case "Canadian": {
        result = "ca";
      }
      break;

      case "Nigerian English": {
        result = "en-NG";
      }
      break;

      case "British English": {
        result = "en-GB";
      }
      break;

      case "New Zealand English": {
        result = "en-NZ";
      }
      break;

      case "French": {
        result = "fr-FR";
      }
      break;

      case "Spanish": {
        result = "es-ES";
      }
      break;

      case "German": {
        result = "de-DE";
      }
      break;

      case "Portuguese": {
        result = "pt-PT";
      }
      break;

      case "Canadian English": {
        result = "en-CA";
      }
      break;

      default: {
        result = langToParse;
      }
      break;
    }
    return result;
  }

}