import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:texttospeech/Screens/speech_to_text.dart';
import 'package:texttospeech/Screens/tts.dart';
import 'package:texttospeech/widgets/custom_textfeild.dart';
import 'package:texttospeech/widgets/round_button.dart';
import 'package:texttospeech/widgets/text_to_voice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSpeak = false;

  TextToVoice instance = TextToVoice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Text To Speech"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomTextField(),
              const SizedBox(
                height: 20,
              ),
              AvatarGlow(
                  animate: isSpeak,
                  glowColor: Colors.pinkAccent,
                  endRadius: 60,
                  child: const Material(
                    elevation: 10,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Color.fromARGB(255, 71, 83, 150),
                      child: Icon(
                        Icons.mic_none_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      instance.play();
                      setState(() {
                        isSpeak = true;
                      });
                    },
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.indigo,
                      size: 50,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      instance.stop();
                      setState(() {
                        isSpeak = false;
                      });
                    },
                    icon: const Icon(
                      Icons.stop_circle,
                      color: Colors.indigo,
                      size: 50,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        instance.pause();

                        setState(() {
                          isSpeak = false;
                        });
                      },
                      icon: const Icon(
                        Icons.pause_circle,
                        color: Colors.indigo,
                        size: 50,
                      )),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Set Volume"),
              Slider(
                  divisions: 10,
                  value: instance.volumeRange,
                  onChanged: (val) {
                    setState(() {
                      instance.volume(val);
                    });
                  }),
              const Text("Set Picth"),
              Slider(
                  divisions: 10,
                  value: instance.pitchRange,
                  onChanged: (val) {
                    setState(() {
                      instance.picth(val);
                    });
                  }),
              const Text("Set Speech Rate"),
              Slider(
                  divisions: 10,
                  value: instance.speechRange,
                  onChanged: (val) {
                    setState(() {
                      instance.rate(val);
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                width: double.infinity,
                title: "Speech To Text",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpeechToTextScreen()));
                },
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TtsWidget()));
                  },
                  icon: const Icon(Icons.share))
            ],
          ),
        ),
      ),
    );
  }
}
