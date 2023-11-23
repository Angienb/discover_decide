import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Discover & Decide')),
        body: SafeArea(
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _assistantPresentation(),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: _inputFieldAndSendButton()),
                      _lastQuestions()
                    ]))));
  }

  Row _assistantPresentation() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Lottie.asset('assets/lotties/robot.json',
          height: Get.width * 0.35,
          width: Get.width * 0.35,
          frameRate: FrameRate(100)),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ChatBubble(
                  clipper: ChatBubbleClipper10(type: BubbleType.receiverBubble),
                  backGroundColor: Colors.white,
                  padding: const EdgeInsets.all(18),
                  child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                            'Hi, I\'m D&D, your personal decision assistant. How can I help you today?',
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.normal),
                            cursor: '|')
                      ],
                      displayFullTextOnTap: true,
                      repeatForever: false,
                      totalRepeatCount: 1))))
    ]);
  }

  Container _lastQuestions() {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Obx(() => Column(children: [
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Or choose from your last questions:',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              ...controller.lastQuestions
                  .map((q) => Padding(
                      padding: const EdgeInsets.all(2),
                      child: ListTile(
                          title: Text(q),
                          onTap: () => controller.sendQuestion(q))))
                  .toList()
            ])));
  }

  SizedBox _inputFieldAndSendButton() {
    return SizedBox(
        width: Get.width,
        child: Row(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: controller.questionController,
                      decoration: const InputDecoration(
                          hintText:
                              'i.e., Top 10 restaurants in Barcelona?')))),
          ElevatedButton(
              onPressed: () =>
                  controller.sendQuestion(controller.questionController.text),
              child: const Icon(Icons.send_rounded))
        ]));
  }
}
