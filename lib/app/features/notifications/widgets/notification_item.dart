import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.dateTime,
      required this.notificationColor});

  final String title;
  final String subtitle;
  final String dateTime;
  final Color notificationColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
      leading: CircleAvatar(
        backgroundColor: notificationColor,
        child: Icon(
          Icons.notifications,
          color: ColorManager.whiteColor,
        ),
      ),
      title: Text(
        title,
        style: getBoldStyle(
          fontSize: 18,
          color: ColorManager.textPrimaryColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: getRegularStyle(
          fontSize: 16,
          color: ColorManager.hintTextColor,
        ).copyWith(
          height: 2
        ),
      ),
      trailing: Column(
        children: [
          const Spacer(),
          Text(
            dateTime,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle(
              fontSize: 12,
              color: ColorManager.notificationDateTimeGrayColor,
            )
          ),
        ],
      ),
    );
  }
}
