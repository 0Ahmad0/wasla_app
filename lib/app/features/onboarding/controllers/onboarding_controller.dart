import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/routes/app_routes.dart';

import '../model/onboarding_model.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController pageController;

  List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding1.png',
      title: '🛍️ تسوّق بذوق.. حياتك أرقى!',
      description: 'اكتشف أحدث العطور، الملابس، والأحذية من أفضل الماركات العالمية في مكان واحد!',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: '🚚 طلباتك توصلك.. حيثما كنت!',
      description: 'نضمن لك توصيلًا سريعًا وموثوقًا حتى عتبة دارك!',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: '💳 دفع آمن.. وسريع!',
      description: 'اختياراتك بأسعار منافسة ودفع آمن بكل الطرق المتاحة!',
    ),
  ];

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void skip() {
    Get.offAllNamed(AppRoutes.login);
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
