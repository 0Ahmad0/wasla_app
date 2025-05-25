import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/controllers/auth_controller.dart';
import 'package:wasla_app/app/features/auth/widget/auth_square_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../../core/style_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_button_widget.dart';
import '../../../widgets/app_scaffold_widget.dart';
import '../../../widgets/app_textfield_widget.dart';

class ForgetPasswordView extends GetView<AuthController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBarWidget(
        title: StringsManager.forgetPasswordText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          child: Form(
            key: controller.forgetFormKey,
            child: Column(
              children: [
                20.h.height,
                AuthSquareWidget(
                  icon: AssetsManager.emailAndOtpIcon,
                ),
                16.h.height,
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.forgetPasswordText,
                  style: getBoldStyle(
                    color: ColorManager.primaryColor,
                    fontSize: 32,
                  ),
                ),
                6.h.height,
                Text(
                  textAlign: TextAlign.center,
                  StringsManager.forgetPasswordDescriptionText,
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
                14.h.height,
                AppButtonWidget(
                  onPressed: (){
                    controller.forgetPassword();
                  },
                  text: StringsManager.followText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
