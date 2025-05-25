import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:wasla_app/app/features/product_details/model/product_review_model.dart';

import '../../../../core/assets_manager.dart';
import '../../home/model/product_model.dart';

class ProductDetailsController extends GetxController {
  final RxList<ProductReviewModel> productUsersReviews = <ProductReviewModel>[
    ProductReviewModel(
      name: "أحمد العلي",
      review: "منتج ممتاز، يعمل بشكل رائع وذو جودة عالية. أنصح به بشدة!",
      userImage: AssetsManager.appIcon,
      rating: 5,
    ),
    ProductReviewModel(
      name: "ليلى يوسف",
      review: "المنتج جيد لكن حجم القطعة أصغر من المتوقع.",
      userImage: null,
      rating: 4,
    ),
    ProductReviewModel(
      name: "محمد سالم",
      review: "المنتج ليس كما في الصورة، جودة الخامة ضعيفة.",
      userImage: AssetsManager.onBoarding2IMG,
      rating: 2,
    ),
    ProductReviewModel(
      name: "نور الحسن",
      review: "المنتج رائع ويعمل كما هو موضح في الوصف. أوصي به!",
      userImage: null,
      rating: 5,
    ),
    ProductReviewModel(
      name: "خالد فهد",
      review: "المنتج جيد ولكن أعتقد أنه يمكن تحسين التصميم.",
      userImage: 'assets/images/img.png',
      rating: 3,
    ),
    ProductReviewModel(
      name: "سمية محمد",
      review: "جودة المنتج سيئة، لا يعمل كما هو متوقع.",
      userImage: 'assets/images/img.png',
      rating: 1,
    ),
    ProductReviewModel(
      name: "علي الزهراني",
      review: "المنتج ممتاز لكن يحتاج وقتًا طويلاً للشحن.",
      userImage: null,
      rating: 4,
    ),
    ProductReviewModel(
      name: "سارة فهد",
      review: "منتج مدهش، أعتقد أنه أفضل من المنتجات الأخرى التي جربتها.",
      userImage: 'assets/images/img.png',
      rating: 5,
    ),
    ProductReviewModel(
      name: "حسن محمد",
      review: "المنتج متوسط، لم يكن بالحد المتوقع.",
      userImage: null,
      rating: 3,
    ),
    ProductReviewModel(
      name: "منى عبد الله",
      review: "المنتج جاء مع عيوب في التصنيع. للأسف، خيبة أمل كبيرة.",
      userImage: 'assets/images/img.png',
      rating: 2,
    ),
    ProductReviewModel(
      name: "محمود عادل",
      review: "المنتج جيد ولكنه جاء متأخرًا جدًا.",
      userImage: null,
      rating: 3,
    ),
    ProductReviewModel(
      name: "فاطمة علي",
      review: "منتج جيد، لا بأس به لكن كان يمكن أن يكون أفضل.",
      userImage: 'assets/images/img.png',
      rating: 4,
    ),
  ].obs;
  final List<String> sizesProductList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  final List<Color> colorProductList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];
  final rateKey = GlobalKey<FormState>();
  final reteTextController = TextEditingController();

  RxDouble rating = 2.0.obs;

  late final ProductModel? product;

  RxInt productQuantity = 1.obs;
  RxInt sizeSelected = (-1).obs;
  RxInt colorSelected = (1).obs;

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

  void addReview(ProductReviewModel review) {
    productUsersReviews.add(review);
    reteTextController.clear();
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
