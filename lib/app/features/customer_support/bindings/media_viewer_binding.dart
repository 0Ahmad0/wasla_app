import 'package:get/get.dart';
import 'package:wasla_app/app/features/customer_support/controllers/media_viewer_controller.dart';

class MediaViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MediaViewerController());
  }
}
