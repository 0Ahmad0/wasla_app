import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_padding.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../../../widgets/backbutton_widget.dart';
import '../controllers/auth_controller.dart';
import '../widget/auth_square_widget.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.enterOtpText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          child: Column(
            children: [
              20.h.height,
              AuthSquareWidget(
                icon: AssetsManager.emailAndOtpIcon,
              ),
              16.h.height,
              Text(
                textAlign: TextAlign.center,
                StringsManager.enterOtpText,
                style: getBoldStyle(
                  color: ColorManager.primaryColor,
                  fontSize: 32,
                ),
              ),
              6.h.height,
              Text(
                textAlign: TextAlign.center,
                StringsManager.enterOtpDescriptionText,
                style: getRegularStyle(
                  color: ColorManager.textSecondaryColor,
                  fontSize: 18,
                ),
              ),
              12.h.height,
              Form(
                key: controller.otpFormKey,
                child: Pinput(
                  controller: controller.otpController,
                  length: 5,
                  autofocus: true,
                  showCursor: true,
                  submittedPinTheme: PinTheme(
                    width: 66.w,
                    height: 66.w,
                    textStyle: getRegularStyle(
                        color: ColorManager.whiteColor, fontSize: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 66.w,
                    height: 66.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorManager.secondaryColor.withOpacity(.1),
                    ),
                  ),
                  onSubmitted: (value) {},
                  onCompleted: (value) {},

                  validator: controller.validateOtp,
                  errorTextStyle: getRegularStyle(
                    color: ColorManager.errorColor
                  ),
                ),
              ),
              20.h.height,
              AppButtonWidget(
                onPressed: controller.checkOtp,
                text: StringsManager.validateText,
              ),
              18.h.height,
              Align(
                alignment: AlignmentDirectional.center,
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: StringsManager.doNotReceiveOtpText,
                        style: getRegularStyle(
                            color: ColorManager.textPrimaryColor,
                            fontSize: 18
                        )
                    ),
                    TextSpan(
                        text: StringsManager.reSendOtpText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                        style: getRegularStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 18
                        ))
                  ]),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
