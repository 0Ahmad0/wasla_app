import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/core/utils/app_launcher_helper.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/const_manager.dart';

class ContactReasonItemWidget extends StatelessWidget {
  const ContactReasonItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.body = '',
    this.email = ConstManager.appEmail,
  });

  final String title;
  final String body;
  final String email;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => LauncherHelper.launchEmail(
        toEmail: email,
        subject: title,
        body: body,
      ),
      leading: CircleAvatar(
        backgroundColor: ColorManager.primaryColor,
        child: Icon(
          icon,
          color: ColorManager.whiteColor,
          size: 20.sp,
        ),
      ),
      title: Text(title),
    );
  }
}
