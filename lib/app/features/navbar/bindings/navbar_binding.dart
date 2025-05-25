import 'package:get/get.dart';
import 'package:wasla_app/app/features/navbar/controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
  }
}
