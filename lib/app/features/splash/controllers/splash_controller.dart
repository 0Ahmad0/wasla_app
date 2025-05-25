import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';

class SplashController extends GetxController {
  final int splashDelayed = 3;

  void _navigateToNext()  {
    Future.delayed(
      Duration(
        seconds: splashDelayed,
      ),
      () {
        Get.offAllNamed(AppRoutes.onboarding);
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }
}
