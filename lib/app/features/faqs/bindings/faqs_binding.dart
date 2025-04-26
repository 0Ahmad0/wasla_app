import 'package:get/get.dart';
import 'package:wasla_app/app/features/faqs/controllers/faqs_controller.dart';

class FAQsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAQsController());
  }
}
