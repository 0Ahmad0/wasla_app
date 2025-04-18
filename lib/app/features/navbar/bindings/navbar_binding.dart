import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/app/features/navbar/controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavbarController());
  }
}
