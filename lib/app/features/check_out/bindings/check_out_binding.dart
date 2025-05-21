import 'package:get/get.dart';
import 'package:wasla_app/app/features/check_out/controllers/check_out_controller.dart';

class CheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckOutController());
  }
}
