import 'dart:async';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class ProductDetailsController extends GetxController {
  RxInt productQuantity = 1.obs;
  final int maxQuantity = 20;
  Timer? _timer;

  void vibrateDevice() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 200); // 200ms
    }
  }

  List<String> getCustomPrice(double price) {
    String priceStr = (price).toStringAsFixed(2);
    return priceStr.split('.');
  }
  double getCustomPriceAsDouble(double unitPrice) {
    return productQuantity.value * unitPrice;
  }


  void incrementProductQuantity() {
    if (productQuantity.value < maxQuantity) {
      productQuantity.value++;
    } else {
      Get.snackbar("تنبيه", "لا يمكن طلب أكثر من الحد المسموح",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void decrementProductQuantity() {
    if (productQuantity.value > 1) {
      productQuantity.value--;
    } else {
      Get.snackbar("تنبيه", "لا يمكن تقليل الكمية إلى أقل من 0",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void startIncrementing() {
    incrementProductQuantity();
    _timer = Timer.periodic(
        const Duration(milliseconds: 100), (_) => incrementProductQuantity());
  }

  void startDecrementing() {
    decrementProductQuantity();
    _timer = Timer.periodic(
        const Duration(milliseconds: 100), (_) => decrementProductQuantity());
  }

  void stopCounter() {
    _timer?.cancel();
  }
}
