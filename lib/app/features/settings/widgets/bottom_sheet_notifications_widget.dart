import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../controllers/settings_controller.dart';

class BottomSheetNotificationsWidget extends GetView<SettingsController> {
  const BottomSheetNotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
            ),
          ),
          title: const Text(
            StringsManager.notificationAppText,
          ),
        ),
        const Divider(
          thickness: .5,
        ),
        SwitchListTile(
          title: const Text(StringsManager.messagesNotificationText),
          value: controller.messagesNotification.value,
          onChanged: controller.toggleMessages,
          // secondary: const Icon(Icons.message),
          dense: true,
        ),
        SwitchListTile(
          title: const Text(StringsManager.ordersNotificationText),
          value: controller.ordersNotification.value,
          onChanged: controller.toggleOrders,
          // secondary: const Icon(Icons.shopping_bag),
          dense: true,
        ),
        SwitchListTile(
          title: const Text(StringsManager.offersNotificationText),
          value: controller.offersNotification.value,
          onChanged: controller.toggleOffers,
          // secondary: const Icon(Icons.local_offer),
          dense: true,
        ),
      ],
    ));
  }
}
