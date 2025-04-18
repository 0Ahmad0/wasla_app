import 'package:get/get.dart';
import 'package:wasla_app/app/features/coupons/controllers/coupons_controller.dart';

class CouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CouponsController());
  }
}
