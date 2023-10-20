import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:texttospeech/models/speech_to_text.dart';

import 'package:texttospeech/widgets/icon_button.dart';
import 'package:texttospeech/widgets/round_button.dart';

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  bool isLoading = false;
  SpeechToTextModel speechToTextModel = SpeechToTextModel();

  @override
  void initState() {
    super.initState();
    speechToTextModel.initializeSpeechToText();
    speechToTextModel.onComplted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speech To Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: isLoading
                    ? Center(
                        child: LoadingAnimationWidget.beat(
                            size: 40, color: Colors.deepOrange))
                    : IconBtn(
                        icon: Icons.mic,
                        ontap: () {
                          speechToTextModel.speechToTextInstance.isListening
                              ? speechToTextModel.stopListenNow()
                              : speechToTextModel.startListenNow(context);
                        },
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 4,
                controller: speechToTextModel.textController,
                decoration: const InputDecoration(
                    hintText: "your Speech", border: OutlineInputBorder()),
                onChanged: (newText) {
                  setState(() {
                    speechToTextModel.recordedVoice = newText;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundButton(
                      width: 150,
                      title: "START",
                      ontap: () {
                        setState(() {
                          speechToTextModel.startListenNow(context);
                          isLoading = true;
                        });
                      }),
                  RoundButton(
                      width: 150,
                      title: "Stop",
                      ontap: () {
                        setState(() {
                          speechToTextModel.startListenNow(context);
                          isLoading = false;
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
