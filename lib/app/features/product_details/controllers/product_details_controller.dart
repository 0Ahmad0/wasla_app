import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

import '../../home/model/product_model.dart';

class ProductDetailsController extends GetxController {
  late final ProductModel? product;
  final rateKey = GlobalKey<FormState>();
  final reteTextController = TextEditingController();
  RxDouble rating = 2.0.obs;

  RxInt productQuantity = 1.obs;
  final int maxQuantity = 20;
  Timer? _timer;
  RxInt activeSubImageProductIndex = (-1).obs;

  List<String> otherImagesProduct = [
    'https://picsum.photos/id/1011/400/200',
    'https://picsum.photos/id/1018/200/200',
    'https://picsum.photos/id/1025/200/200',
    'https://picsum.photos/id/1020/200/200'
  ];

  void onRatingUpdate(double rate) {
    rating.value = rate;
  }

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
      Get.snackbar("تنبيه", "لا يمكن تقليل الكمية إلى أقل من 1",
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

  void changeActiveSubImageProductIndex(int index) {
    activeSubImageProductIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }
  @override
  void onClose() {
    reteTextController.dispose();
    super.onClose();
  }
}
