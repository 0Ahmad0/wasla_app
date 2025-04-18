import 'package:get/get.dart';
import 'package:wasla_app/app/features/profile/controllers/profile_controller.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
