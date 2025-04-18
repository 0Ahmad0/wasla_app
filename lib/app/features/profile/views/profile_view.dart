import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/profile/controllers/profile_controller.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../../../widgets/backbutton_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>ProfileController());
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.profileText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          vPadding: 10,
          child: Form(
            key: controller.profileFormKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.blackColor.withOpacity(.16),
                        blurRadius: 16.sp,
                        spreadRadius: 0,
                        offset: Offset.zero
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    radius: 60.sp,
                    backgroundImage: AssetImage('assets/images/img.png'),
                  ),
                ),
                10.h.height,
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
                  controller: controller.phoneController,
                  hintText: StringsManager.phoneText,
                  keyboardType: TextInputType.phone,
                  validator: controller.validatePhone,
                ),
                16.h.height,
                AppButtonWidget(
                  text: StringsManager.saveChangesText,

                  onPressed: controller.editProfile,
                ),
                16.h.height,
                AppButtonWidget(
                  text: StringsManager.deleteAccountText,
                  onPressed: () {},
                  backgroundColor: ColorManager.errorColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
