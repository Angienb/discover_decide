import 'package:discover_decide/app/data/models/models.dart';
import 'package:discover_decide/app/theme/colors.dart';
import 'package:discover_decide/app/widgets/alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../data/providers/api.dart';

class HomeController extends GetxController {
  TextEditingController questionController = TextEditingController();

  RxList<String> lastQuestions = [
    'Top 10 restaurants in Barcelona',
    'Best country to live in the world',
    'What is the best programming language to learn',
  ].obs;

  sendQuestion(String question) async {
    if (question.isEmpty) {
      showSnackBar('Please enter a question', 'Question cannot be empty',
          icon: Icons.error_rounded);
    } else {
      await Get.showOverlay(
          asyncFunction: () async {
            try {
              var response = await call(body: question);
              if (response.containsKey('success')) {
                ChatGPTResponse chatGPTResponse =
                    ChatGPTResponse.fromJson(response['success']);
                Get.toNamed(Routes.RESULT, arguments: {
                  'question': question,
                  'rankingList': chatGPTResponse.getChoice.getRankingList
                });
                questionController.clear();
                lastQuestions.add(question);
              }
            } catch (e) {
              showSnackBar('Something went wrong',
                  'Seems I can\'t help you with this question. Try another one.',
                  icon: Icons.warning_rounded);
            }
          },
          loadingWidget: Center(
              child: CircularProgressIndicator(
                  color: AppColors.SECONDARY_COLOR, strokeWidth: 1)));
    }
  }
}
