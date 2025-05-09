import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/profile/controllers/profile_controller.dart';
import 'package:wasla_app/app/features/profile/widgets/bottom_sheet_profile_widget.dart';
import 'package:wasla_app/app/features/profile/widgets/delete_account_dialog_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_bottom_sheet.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_textfield_widget.dart';
import '../../../widgets/backbutton_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ProfileController());
    return Scaffold(
      appBar: const AppBarWidget(
        title: StringsManager.profileText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          vPadding: 10,
          child: Form(
            key: controller.profileFormKey,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
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
                                offset: Offset.zero)
                          ]),
                      child: Obx(() => controller.selectedImage.value == null
                          ? CircleAvatar(
                              backgroundColor:
                                  ColorManager.secondaryColor.withOpacity(.25),
                              radius: 60.sp,
                              child: SvgPicture.asset(
                                AssetsManager.profileIcon,
                                width: 34.sp,
                                height: 34.sp,
                              ),
                            )
                          : CircleAvatar(
                              backgroundColor:
                                  ColorManager.secondaryColor.withOpacity(.25),
                              radius: 60.sp,
                              backgroundImage:
                                  FileImage(controller.selectedImage.value!),
                            )),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: ColorManager.primaryColor,
                        child: IconButton(
                            onPressed: () => AppBottomSheet(
                                    widget: const BottomSheetProfileWidget())
                                .showAppBottomSheet(context),
                            icon: Icon(
                              Icons.add_a_photo_outlined,
                              color: ColorManager.whiteColor,
                              size: 20.sp,
                            )),
                      ),
                    )
                  ],
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
                  onPressed: () {
                    AppDialog(widget: const DeleteAccountDialogWidget())
                        .showAppDialog(context);
                  },
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
