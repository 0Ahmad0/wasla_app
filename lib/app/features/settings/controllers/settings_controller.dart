import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  RxString selectedLanguage = 'ar'.obs;
  RxBool messagesNotification = false.obs;
  RxBool ordersNotification = true.obs;
  RxBool offersNotification = false.obs;

  RxBool isDarkMode = false.obs;

  void toggleMessages(bool value) => messagesNotification.value = value;
  void toggleOrders(bool value) => ordersNotification.value = value;
  void toggleOffers(bool value) => offersNotification.value = value;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void changeLanguage(String langCode) {
    selectedLanguage.value = langCode;
    Get.updateLocale(Locale(langCode));
    Get.back();
  }

}