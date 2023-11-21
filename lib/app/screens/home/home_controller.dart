import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../data/providers/api.dart';

class HomeController extends GetxController {
  TextEditingController questionController = TextEditingController();

  RxList<String> lastQuestions = [
    'Top 10 restaurants in Barcelona',
    'Best country to live in the world'
  ].obs;

  sendQuestion(String question) async {
    assert(question.isNotEmpty, 'Question cannot be empty');
    await Get.showOverlay(
        asyncFunction: () async {
          //TODO pass question
          // var response = await call();
          // if (response.containsKey('success')) {
          //   print(response);
          //   Get.toNamed(Routes.RESULT, arguments: response);
          // }
        },
        loadingWidget: const Center(child: CircularProgressIndicator()));
  }
}
