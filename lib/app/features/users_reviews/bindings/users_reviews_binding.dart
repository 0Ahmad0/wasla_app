import 'package:get/get.dart';
import 'package:wasla_app/app/features/users_reviews/controllers/users_reviews_controller.dart';

class UsersReviewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UsersReviewsController(),
    );
  }
}
