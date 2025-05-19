import 'package:get/get.dart';
import 'package:wasla_app/app/features/pay/controllers/pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayController());

  }
}
