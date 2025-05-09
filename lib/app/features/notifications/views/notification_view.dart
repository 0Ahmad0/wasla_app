import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/navbar/controllers/navbar_controller.dart';
import 'package:wasla_app/app/features/notifications/controllers/notification_controller.dart';
import 'package:wasla_app/app/features/notifications/widgets/notification_item.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/backbutton_widget.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => NotificationController());
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.notificationText,
      ),
      body: FadeInDown(
        key: UniqueKey(),
        child: ListView.separated(
          itemBuilder: (context, index) {
            final notificationItem = controller.notifications[index];
            return NotificationItem(
                title: notificationItem.title,
                subtitle: notificationItem.subtitle,
                dateTime: notificationItem.dateTime,
                notificationColor: notificationItem.notificationColor);
          },
          separatorBuilder: (_, __) => Divider(
            color: ColorManager.notificationDividerColor,
            thickness: .75,
            height: 4.h,
          ),
          itemCount: controller.notifications.length,
        ),
      ),
    );
  }
}
