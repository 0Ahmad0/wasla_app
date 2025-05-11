import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/assets_manager.dart';

import '../model/user_review_model.dart';

class UsersReviewsController extends GetxController {
  final RxList<UserReviewModel> userReviews = <UserReviewModel>[
    UserReviewModel(
      name: "أحمد العلي",
      review: "تطبيق ممتاز وسهل الاستخدام، تجربة رائعة في الشراء!",
      userImage: AssetsManager.appIcon,
      rating: 5,
    ),
    UserReviewModel(
      name: "ليلى يوسف",
      review: "خدمة التوصيل كانت سريعة والمنتجات كما توقعتها.",
      userImage: null,
      rating: 4,
    ),
    UserReviewModel(
      name: "محمد سالم",
      review: "التطبيق جيد ولكن يحتاج بعض التحسين في التصميم.",
      userImage: AssetsManager.onBoarding2IMG,
      rating: 3,
    ),
    UserReviewModel(
      name: "نور الحسن",
      review: "أعجبني تنوع المنتجات والعروض، أنصح به بشدة.",
      userImage: null,
      rating: 5,
    ),
    UserReviewModel(
      name: "خالد فهد",
      review: "واجهتني مشكلة في الدفع لكن تم حلها بسرعة من الدعم.",
      userImage: 'assets/images/img.png',
      rating: 4,
    ),
  ].obs;
  final rateKey = GlobalKey<FormState>();
  final reteTextController = TextEditingController();

  RxDouble rating = 2.0.obs;

  String getEmojiIcon() {
    switch (rating.value) {
      case 1.0:
        return AssetsManager.angryIMG;
      case 2.0:
        return AssetsManager.sadIMG;
      case 3.0:
        return AssetsManager.happyIMG;
      case 4.0:
        return AssetsManager.normalIMG;
      case 5.0:
        return AssetsManager.veryHappyIMG;
      default:
        return '';
    }
  }

  void onRatingUpdate(double rate) {
    rating.value = rate;
  }

  void addReview(UserReviewModel review) {
    userReviews.add(review);
    reteTextController.clear();

  }

  @override
  void onClose() {
    reteTextController.dispose();
    super.onClose();
  }
}
