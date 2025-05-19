import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:wasla_app/app/features/about/views/about_view.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../home/model/product_model.dart';

class CartController extends GetxController {
  List<ProductModel> allProducts = [
    ProductModel(
      id: 'p1',
      name: 'تيشيرت رجالي',
      imageUrl: 'https://picsum.photos/id/1005/200/200',
      price: 79.99,
    ),
    ProductModel(
      id: 'p2',
      name: 'جاكيت شتوي',
      imageUrl: 'https://picsum.photos/id/1012/200/200',
      price: 199.99,
    ),
    ProductModel(
      id: 'p3',
      name: 'فستان سهرة',
      imageUrl: 'https://picsum.photos/id/1018/200/200',
      price: 249.99,
    ),
    ProductModel(
      id: 'p4',
      name: 'بلوزة حرير',
      imageUrl: 'https://picsum.photos/id/1020/200/200',
      price: 129.99,
    ),
    ProductModel(
      id: 'p5',
      name: 'حذاء رياضي',
      imageUrl: 'https://picsum.photos/id/1025/200/200',
      price: 149.99,
    ),
    ProductModel(
      id: 'p6',
      name: 'كعب نسائي',
      imageUrl: 'https://picsum.photos/id/1026/200/200',
      price: 189.99,
    ),
    ProductModel(
      id: 'p7',
      name: 'سماعات بلوتوث',
      imageUrl: 'https://picsum.photos/id/1032/200/200',
      price: 89.99,
    ),
    ProductModel(
      id: 'p8',
      name: 'ماوس لاسلكي',
      imageUrl: 'https://picsum.photos/id/1033/200/200',
      price: 49.99,
    ),
    ProductModel(
      id: 'p9',
      name: 'iPhone 14',
      imageUrl: 'https://picsum.photos/id/1041/200/200',
      price: 1099.99,
    ),
    ProductModel(
      id: 'p10',
      name: 'Samsung Galaxy S22',
      imageUrl: 'https://picsum.photos/id/1042/200/200',
      price: 999.99,
    ),
    ProductModel(
      id: 'p11',
      name: 'خلاط كهربائي',
      imageUrl: 'https://picsum.photos/id/1051/200/200',
      price: 299.99,
    ),
    ProductModel(
      id: 'p12',
      name: 'مكنسة كهربائية',
      imageUrl: 'https://picsum.photos/id/1052/200/200',
      price: 499.99,
    ),
    ProductModel(
      id: 'p13',
      name: 'طاولة قهوة',
      imageUrl: 'https://picsum.photos/id/1061/200/200',
      price: 259.99,
    ),
    ProductModel(
      id: 'p14',
      name: 'كنبة 3 مقاعد',
      imageUrl: 'https://picsum.photos/id/1062/200/200',
      price: 799.99,
    ),
    ProductModel(
      id: 'p15',
      name: 'كريم أساس',
      imageUrl: 'https://picsum.photos/id/1071/200/200',
      price: 59.99,
    ),
    ProductModel(
      id: 'p16',
      name: 'أحمر شفاه',
      imageUrl: 'https://picsum.photos/id/1072/200/200',
      price: 39.99,
    ),
    ProductModel(
      id: 'p17',
      name: 'عطر رجالي فاخر',
      imageUrl: 'https://picsum.photos/id/1081/200/200',
      price: 229.99,
    ),
    ProductModel(
      id: 'p18',
      name: 'عطر نسائي مميز',
      imageUrl: 'https://picsum.photos/id/1082/200/200',
      price: 199.99,
    ),
  ];

  final int maxQuantity = 20;
  Timer? _timer;

  final RxMap<String, int> productQuantities = <String, int>{}.obs;

  void setInitialQuantities() {
    for (var product in allProducts) {
      productQuantities[product.id] = 1;
    }
  }

  int getQuantity(String productId) {
    return productQuantities[productId] ?? 1;
  }

  void incrementProductQuantity(String productId) {
    if ((productQuantities[productId] ?? 1) < maxQuantity) {
      productQuantities[productId] = getQuantity(productId) + 1;
    } else {
      Get.snackbar("تنبيه", "لا يمكن طلب أكثر من الحد المسموح",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void decrementProductQuantity(String productId) {
    if ((productQuantities[productId] ?? 1) > 1) {
      productQuantities[productId] = getQuantity(productId) - 1;
    } else {
      Get.snackbar("تنبيه", "لا يمكن تقليل الكمية إلى أقل من 1",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void startIncrementing(String productId) {
    incrementProductQuantity(productId);
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => incrementProductQuantity(productId),
    );
  }

  List<String> getCustomPrice(double price) {
    String priceStr = (price).toStringAsFixed(2);
    return priceStr.split('.');
  }

  void startDecrementing(String productId) {
    decrementProductQuantity(productId);
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => decrementProductQuantity(productId),
    );
  }

  void removeProduct(String productId) {
    productQuantities.remove(productId);
    allProducts.removeWhere((p) => p.id == productId);
    update();
  }

  void showDeleteProductHint() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar('تنوبه', 'اسحب العنصر لحذفه',
          duration: const Duration(seconds: 2),
          backgroundColor: ColorManager.textPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          overlayColor: ColorManager.transparentColor,
          barBlur: 0.0,
          icon: const Icon(Icons.swipe, color: Colors.white),
          margin: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 40.h,
          ));
    });
  }

  @override
  void onInit() {
    super.onInit();
    showDeleteProductHint();
    for (var product in allProducts) {
      productQuantities[product.id] = 1;
    }
  }

  double getTotalPrice(String productId, double unitPrice) {
    return (productQuantities[productId] ?? 1) * unitPrice;
  }

  double get cartTotalPrice {
    double total = 0;
    for (var product in allProducts) {
      final quantity = productQuantities[product.id] ?? 1;
      total += quantity * product.price;
    }
    return total;
  }

  void incrementQuantity(String productId) {
    if ((productQuantities[productId] ?? 1) < maxQuantity) {
      productQuantities[productId] = (productQuantities[productId] ?? 1) + 1;
    } else {
      Get.snackbar("تنبيه", "لا يمكن طلب أكثر من الحد المسموح",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void decrementQuantity(String productId) {
    if ((productQuantities[productId] ?? 1) > 1) {
      productQuantities[productId] = (productQuantities[productId] ?? 1) - 1;
    } else {
      Get.snackbar("تنبيه", "لا يمكن تقليل الكمية إلى أقل من 1",
          snackPosition: SnackPosition.BOTTOM);
      vibrateDevice();
      stopCounter();
    }
  }

  void stopCounter() {
    _timer?.cancel();
  }

  void vibrateDevice() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 200);
    }
  }
}
