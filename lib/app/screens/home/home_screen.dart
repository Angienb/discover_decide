import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'home_controller.dart';

/// Displays a list of SampleItems.
class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Discover & Decide')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Lottie.asset('assets/lotties/robot.json',
                            height: Get.width * 0.35,
                            width: Get.width * 0.35,
                            frameRate: FrameRate(100))),
                    Expanded(
                        child: ChatBubble(
                            clipper: ChatBubbleClipper10(
                                type: BubbleType.receiverBubble),
                            backGroundColor: Colors.white,
                            padding: EdgeInsets.all(18),
                            child: Container(
                                child: AnimatedTextKit(
                                    animatedTexts: [
                                  TypewriterAnimatedText(
                                      'Hi, I\'m D&D, your personal assistant. Ask me for recommendations and I will do my best to help you out!',
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      cursor: '|')
                                ],
                                    displayFullTextOnTap: true,
                                    repeatForever: false,
                                    totalRepeatCount: 1))))
                  ]),
                  Spacer(),
                  const Text('Ask a question:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Container(
                      width: Get.width,
                      child: Row(children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    controller: controller.questionController,
                                    decoration: const InputDecoration(
                                        hintText:
                                            'E.g., Top 10 restaurants in Barcelona?')))),
                        ElevatedButton(
                            onPressed: () => controller.sendQuestion(
                                controller.questionController.text),
                            child: const Icon(Icons.send_rounded))
                      ])),
                  Spacer(),
                  const Text('Or repeat from your last questions:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Expanded(
                      child: Obx(() => ListView.builder(
                          itemCount: controller.lastQuestions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(controller.lastQuestions[index]),
                                onTap: () => controller.sendQuestion(
                                    controller.lastQuestions[index]));
                          })))
                ])));
  }
}
