import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/controllers/auth_controller.dart';
import 'package:wasla_app/app/features/auth/widget/auth_square_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/app_textfield_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/style_manager.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_scaffold_widget.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: AppPadding(
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  20.h.height,
                  GestureDetector(
                    onTap: (){
                      Get.offAllNamed(AppRoutes.navbar);
                    },
                    child: const AuthSquareWidget(
                      icon: AssetsManager.handLoginIcon,
                    ),
                  ),
                  16.h.height,
                  Text(
                    textAlign: TextAlign.center,
                    StringsManager.loginText,
                    style: getBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 32,
                    ),
                  ),
                  6.h.height,
                  Text(
                    textAlign: TextAlign.center,
                    StringsManager.loginDescriptionText,
                    style: getRegularStyle(
                      color: ColorManager.textSecondaryColor,
                      fontSize: 18,
                    ),
                  ),
                  12.h.height,
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
                  2.h.height,
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.forgetPassword);
                      },
                      child: Text(
                        StringsManager.forgotPasswordText,
                        style: getRegularStyle(
                          color: ColorManager.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ) ,
                  6.h.height,
                  AppButtonWidget(
                    onPressed: controller.login,
                    text: StringsManager.loginText,
                  ),
                  18.h.height,
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: StringsManager.doNotHaveAccountText,
                          style: getRegularStyle(
                            color: ColorManager.textPrimaryColor,
                            fontSize: 18
                          )
                        ),
                        TextSpan(
                            text: StringsManager.signupText,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              Get.offNamed(AppRoutes.signup);
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
        ),
      ),
    );
  }
}
