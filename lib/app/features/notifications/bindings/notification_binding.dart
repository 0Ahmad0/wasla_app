import 'package:get/get.dart';
import 'package:wasla_app/app/features/notifications/controllers/notification_controller.dart';


class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());

  }
}

