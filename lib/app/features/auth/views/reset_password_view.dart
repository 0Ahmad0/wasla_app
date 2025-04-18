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
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_padding.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../../../widgets/backbutton_widget.dart';
import '../widget/auth_square_widget.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.resetPasswordText,
        leading: BackButtonWidget(),
      ),

      body: SingleChildScrollView(
        child: AppPadding(
          child: Form(
            key: controller.resetFormKey,
            child: Column(
              children: [
                20.h.height,
                AuthSquareWidget(
                  icon: AssetsManager.resetPasswordIcon,
                ),
                16.h.height,
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.resetPasswordText,
                  style: getBoldStyle(
                    color: ColorManager.primaryColor,
                    fontSize: 32,
                  ),
                ),
                6.h.height,
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.resetPasswordDescriptionText,
                  style: getRegularStyle(
                    color: ColorManager.textSecondaryColor,
                    fontSize: 18,
                  ),
                ),
                12.h.height,
                AppTextField(
                  controller: controller.passwordController,
                  hintText: StringsManager.newPasswordText,
                  validator: controller.validatePassword,
                  suffixIcon: true,
                  obscureText: true,
                ),

                8.h.height,
                AppTextField(
                  controller: controller.confirmPasswordController,
                  hintText: StringsManager.confirmNewPasswordText,
                  validator: controller.validateConfirmPassword,
                  suffixIcon: true,
                  obscureText: true,
                ),
                20.h.height,
                AppButtonWidget(
                  onPressed: controller.resetPassword,
                  text: StringsManager.setNewPasswordText,
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
