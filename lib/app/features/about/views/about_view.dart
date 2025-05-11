import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_label_slide/bottom_bar_label_slide.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/about/controllers/about_controller.dart';
import 'package:wasla_app/app/features/about/widgets/bottom_sheet_contact_widget.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/dialogs/app_bottom_sheet.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.aboutAppText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          child: Column(
            children: [
              InkWell(
                onTap: controller.onClickLogo,
                borderRadius: BorderRadius.circular(100.0),
                child: Obx(()=>CircleAvatar(
                  key: ValueKey(controller.animationIndex.value),
                  radius: 60.sp,
                  backgroundColor: ColorManager.secondaryColor.withOpacity(.25),
                  child: AppPadding(
                    vPadding: 0,
                    hPadding: 20,
                    child: SvgPicture.asset(
                      AssetsManager.logoIMG,
                    ),
                  ),
                ).let(
                        (widget)=> controller.animations[controller.animationIndex.value](widget)
                )),
              ),
              Html(
                data: StringsManager.aboutUsText,
                onLinkTap: (
                  url,
                  context,
                  attributes,
                ) {
                  AppBottomSheet(
                    widget: const BottomSheetContactWidget(),
                  ).showAppBottomSheet(Get.context!);
                },
              ).fadeIn(duration: Duration(milliseconds: 2000)),
            ],
          ),
        ),
      ),
    );
  }
}
