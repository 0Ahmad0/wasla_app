import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/controllers/auth_controller.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_padding.dart';
import '../../../widgets/app_scaffold_widget.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../widget/auth_square_widget.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: AppPadding(
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                children: [
                  20.h.height,
                  AuthSquareWidget(
                    icon: AssetsManager.handSignupIcon,
                  ),
                  16.h.height,
                  Text(
                    textAlign: TextAlign.center,
                    StringsManager.signupText,
                    style: getBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 32,
                    ),
                  ),
                  6.h.height,
                  Text(
                    textAlign: TextAlign.center,
                    StringsManager.signupDescriptionText,
                    style: getRegularStyle(
                      color: ColorManager.textSecondaryColor,
                      fontSize: 18,
                    ),
                  ),
                  12.h.height,
                  AppTextField(
                    controller: controller.fullNameController,
                    hintText: StringsManager.fullNameText,
                    keyboardType: TextInputType.name,
                    validator: controller.validateFullName,
                  ),
                  8.h.height,
                  AppTextField(
                    controller: controller.usernameController,
                    hintText: StringsManager.userNameText,
                    keyboardType: TextInputType.name,
                    validator: controller.validateUsername,
                  ),
                  8.h.height,
                  AppTextField(
                    controller: controller.emailController,
                    hintText: StringsManager.emailText,
                    keyboardType: TextInputType.emailAddress,
                    validator: controller.validateEmail,
                  ),
                  8.h.height,
                  AppTextField(
                    controller: controller.passwordController,
                    hintText: StringsManager.passwordText,
                    validator: controller.validatePassword,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  8.h.height,
                  AppTextField(
                    controller: controller.confirmPasswordController,
                    hintText: StringsManager.confirmPasswordText,
                    validator: controller.validateConfirmPassword,
                    suffixIcon: true,
                    obscureText: true,
                  ),
                  2.h.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          value: controller.acceptTermsAndConditions.value,

                          activeColor: ColorManager.primaryColor,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(
                            color: ColorManager.primaryColor,
                            width: 1.sp,
                          ),
                          onChanged: (value) =>
                              controller.toggleAcceptTerms(value!),
                        ),
                      ),
                      6.w.width,
                      Flexible(
                        child: Text.rich(TextSpan(
                            style: getRegularStyle(fontSize: 16),
                            children: [
                              TextSpan(
                                  text: StringsManager.agreeToTermsText),
                              TextSpan(
                                text: StringsManager.termsOfServiceText,
                                style: getRegularStyle(
                                  color: ColorManager.primaryColor,
                                  fontSize: 16
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/terms');
                                  },
                              ),
                              const TextSpan(text: StringsManager.andConnectorText),
                              TextSpan(
                                text: StringsManager.privacyPolicyText,
                                style: getRegularStyle(
                                  color: ColorManager.primaryColor,
                                  fontSize: 16
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/privacy');
                                  },
                              ),
                              const TextSpan(text: StringsManager.dotText),

                            ])),
                      )
                    ],
                  ),
                  6.h.height,
                  AppButtonWidget(
                    onPressed: controller.signup,
                    text: StringsManager.signupText,
                  ),
                  18.h.height,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: StringsManager.alreadyHaveAccountText,
                            style: getRegularStyle(
                                color: ColorManager.textPrimaryColor,
                                fontSize: 18)),
                        TextSpan(
                            text: StringsManager.loginText,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(AppRoutes.login);
                              },
                            style: getRegularStyle(
                                color: ColorManager.primaryColor, fontSize: 18))
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
