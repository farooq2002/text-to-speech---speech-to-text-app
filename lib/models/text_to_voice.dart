import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToVoice {
  final textController =
      TextEditingController(text: "Write some text for speech");

  double volumeRange = 0.5;
  double pitchRange = 0.1;
  double speechRange = 0.1;

  FlutterTts flutterTts = FlutterTts();

  play() async {
    setLanguage();
    setVoice();
    await flutterTts.speak(textController.text);
  }

  stop() async {
    await flutterTts.stop();
  }

  pause() async {
    await flutterTts.pause();
  }

  volume(val) async {
    volumeRange = val;
    await flutterTts.setVolume(volumeRange);
  }

  picth(val) async {
    pitchRange = val;
    await flutterTts.setPitch(pitchRange);
  }

  rate(val) async {
    speechRange = val;
    await flutterTts.setSpeechRate(pitchRange);
  }

  setVoice() async {
    var voices = await flutterTts.getVoices;

    // Loop through the available voices and choose the one you want by name
    for (var voice in voices) {
      if (voice.name ==
          {
            "name": "en-gb-x-gbb-network",
            "locale": "en-GB",
          }) {
        await flutterTts.setVoice(voice.name);
        break;
      }
    }
  }

  setLanguage() async {
    var lang = await flutterTts.getLanguages;
    await flutterTts.setLanguage(lang[6]);
  }

  shareVoice() async {
    await flutterTts.setSharedInstance(true);
  }
}
