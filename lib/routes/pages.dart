import 'package:discover_decide/app/screens/result.dart/result_screen.dart';
import 'package:discover_decide/routes/routes.dart';
import 'package:get/get.dart';

import '../app/screens/home/home_binding.dart';
import '../app/screens/home/home_screen.dart';

class AppPages {
  static final pages = [
    // First Screen of the app we should have here
    // the first bindings Profile, timeline, Search, Activity
    GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(name: Routes.RESULT, page: () => const ResultScreen())
  ];
}
