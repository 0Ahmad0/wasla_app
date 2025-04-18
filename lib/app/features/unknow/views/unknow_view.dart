import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/backbutton_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class UnKnowView extends StatelessWidget {
  const UnKnowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.unKnowBackgroundColor,
      appBar: AppBarWidget(
        title: StringsManager.pageNotFoundText,
        showLeadingIcon: true,
        leading: BackButtonWidget(),
      ),
      body: AppPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              child: Text(
                StringsManager.notFoundText,
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  fontSize: 100,
                ).copyWith(fontFamily: GoogleFonts.alef().fontFamily),
              ),
            ),
            20.h.height,
            ZoomIn(
              child: SvgPicture.asset(
                AssetsManager.vector404IMG,
                width: 200.w,
                height: 200.w,
              ),
            ),
            20.h.height,
            Text(
              StringsManager.someThingWentWrongText,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: ColorManager.textPrimaryColor,
                  fontSize: 16
              )
            ),
            20.h.height,
            FadeIn(
              child: AppButtonWidget(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.navbar);
                },
                text: StringsManager.goToHomeText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
