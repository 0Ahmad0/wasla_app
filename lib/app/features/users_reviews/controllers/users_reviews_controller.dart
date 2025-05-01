import 'package:get/get.dart';
import 'package:wasla_app/core/assets_manager.dart';

import '../model/user_review_model.dart';

class UsersReviewsController extends GetxController{
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

}