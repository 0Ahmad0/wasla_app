import 'package:get/get.dart';
import 'package:wasla_app/app/features/faqs/controllers/faqs_controller.dart';
import 'package:wasla_app/app/features/my_address/controllers/my_address_controller.dart';

class MyAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddressController());
  }
}
