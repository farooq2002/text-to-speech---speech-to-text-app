


import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextModel{

   final SpeechToText speechToTextInstance = SpeechToText();
  final textController = TextEditingController();
  String recordedVoice = "";
  

   initializeSpeechToText() async {
    await speechToTextInstance.initialize();
   
  }

  startListenNow(BuildContext context) async {
    FocusScope.of(context).unfocus();
    await speechToTextInstance.listen(onResult: onSpeechToTextResult);
  }

  stopListenNow() async {
    await speechToTextInstance.stop();
  }

  onSpeechToTextResult(SpeechRecognitionResult speechRecognitionResult) async {
    recordedVoice = speechRecognitionResult.recognizedWords;

    textController.text = recordedVoice;
    // print(recordedVoice);
  }

  onComplted() {
    speechToTextInstance.isNotListening;
   
  }
}