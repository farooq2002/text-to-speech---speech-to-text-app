import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:texttospeech/widgets/icon_button.dart';
import 'package:texttospeech/widgets/round_button.dart';

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  final SpeechToText speechToTextInstance = SpeechToText();
  final textController = TextEditingController();
  String recordedVoice = "";
  bool isLoading = false;

  initializeSpeechToText() async {
    await speechToTextInstance.initialize();
    setState(() {});
  }

  startListenNow() async {
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
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    initializeSpeechToText();
    onComplted();
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
                          speechToTextInstance.isListening
                              ? stopListenNow()
                              : startListenNow();
                        },
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 4,
                controller: textController,
                decoration: const InputDecoration(
                    hintText: "your Speech", border: OutlineInputBorder()),
                onChanged: (newText) {
                  setState(() {
                    recordedVoice = newText;
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
                          startListenNow();
                          isLoading = true;
                        });
                      }),
                  RoundButton(
                      width: 150,
                      title: "Stop",
                      ontap: () {
                        setState(() {
                          startListenNow();
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
