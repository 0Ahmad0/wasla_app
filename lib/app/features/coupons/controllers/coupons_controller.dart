import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  final List<List<Color>> gradientColorsList = [
    [Color(0xFF0052D4), Color(0xFF4364F7)], // أزرق ملكي - أزرق فاتح
    [Color(0xFF6A0D45), Color(0xFFB42B51)], // خمري - وردي غامق
    [Color(0xFFFFC107), Color(0xFFFF9800)], // أصفر - برتقالي
    [Color(0xFF001F3F), Color(0xFF0074D9)], // أزرق داكن - أزرق ساطع
    [Color(0xFFF78FB3), Color(0xFF9966CC)], // زهري - بنفسجي فاتح
    [Color(0xFF00B894), Color(0xFF55EFC4)], // زمردي - نعناعي
    [Color(0xFF434343), Color(0xFFDDDDDD)], // رمادي - رمادي فاتح
    [Color(0xFFB71C1C), Color(0xFFFF8A65)], // أحمر غامق - برتقالي فاتح
    [Color(0xFF4A148C), Color(0xFFEA80FC)], // بنفسجي داكن - وردي فاتح
    [Color(0xFF89F7FE), Color(0xFF66A6FF)], // أزرق ثلجي - أزرق ناعم
    [Color(0xFF2193b0), Color(0xFF6dd5ed)], // أزرق بحري - أزرق ثلجي
    [Color(0xFFee9ca7), Color(0xFFffdde1)], // وردي هادئ - زهري فاتح
    [Color(0xFF614385), Color(0xFF516395)], // بنفسجي ملكي - أزرق رصاصي
    [Color(0xFFeecda3), Color(0xFFef629f)], // خوخي - وردي
    [Color(0xFF16A085), Color(0xFFF4D03F)], // فيروزي - أصفر ليموني
    [Color(0xFF2980B9), Color(0xFF6DD5FA)], // أزرق غامق - أزرق سماوي
    [Color(0xFFf12711), Color(0xFFf5af19)], // أحمر مشع - برتقالي مشع
    [Color(0xFF4568DC), Color(0xFFB06AB3)], // أزرق - بنفسجي
    [Color(0xFFa1c4fd), Color(0xFFc2e9fb)], // أزرق شفاف - سماوي
    [Color(0xFFffecd2), Color(0xFFfcb69f)], // بيج فاتح - مشمشي
  ];

  late ConfettiController confettiController;

  void showFireworks() {
    confettiController.play();
  }

  @override
  void onInit() {
    confettiController = ConfettiController(
        duration: const Duration(
      milliseconds: 100,
    ));
    super.onInit();
  }

  @override
  void onClose() {
    confettiController.dispose();
    super.onClose();
  }
}
