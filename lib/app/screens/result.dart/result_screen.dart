import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../data/providers/api.dart';

/// Displays a list of SampleItems.
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sample Items')),
        body: TextButton(
            child: const Text('Test GPT api'),
            onPressed: () async {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Get.showOverlay(
                  asyncFunction: () async {
                    var response = await call();
                    print(response);
                    Get.toNamed(Routes.RESULT, arguments: response);
                  },
                  loadingWidget:
                      const Center(child: CircularProgressIndicator()));
            }));
  }
}
