import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/about/widgets/contact_reason_item_widget.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../../core/strings_manager.dart';

class BottomSheetContactWidget extends StatelessWidget {
  const BottomSheetContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            StringsManager.contactUsText,
          ),
        ),
        const Divider(
          thickness: .5,
        ),
        ContactReasonItemWidget(
          title: StringsManager.inquirySubject,
          icon: Icons.question_mark_sharp,
          body: StringsManager.inquiryBody,
        ),
        ContactReasonItemWidget(
          title: StringsManager.complaintSubject,
          icon: Icons.bug_report_outlined,
          body: StringsManager.complaintBody,
        ),
        ContactReasonItemWidget(
          title: StringsManager.suggestionSubject,
          icon: Icons.accessibility_new,
          body: StringsManager.suggestionBody,
        ),
      ],
    );
  }
}
