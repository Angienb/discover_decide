import 'package:discover_decide/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexagon/hexagon.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool animateElements = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        animateElements = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('I found...')),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                _questionTitle(),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        itemCount: Get.arguments['rankingList'].length,
                        itemBuilder: (context, index) => _itemInRanking(index)))
              ])),
        ));
  }

  Padding _questionTitle() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
            '${Get.arguments['rankingList'].length} results for ${Get.arguments['question']}',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
  }

  Widget _itemInRanking(int index) {
    return AnimatedContainer(
        width: Get.width,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 333 + (index * 300)),
        transform:
            Matrix4.translationValues(animateElements ? 0 : Get.width, 0, 0),
        child: Stack(alignment: Alignment.center, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 12)
                  .copyWith(left: 80, right: 12),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    AppColors.MAIN_COLOR,
                    AppColors.SECONDARY_COLOR
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              width: Get.width,
              child: Text(Get.arguments['rankingList'][index],
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.normal))),
          Container(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                HexagonWidget.pointy(
                    height: 68,
                    width: 68,
                    cornerRadius: 10,
                    elevation: .5,
                    padding: 4,
                    color: Colors.white,
                    child: Text('${index + 1} ',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                const Spacer()
              ]))
        ]));
  }
}
