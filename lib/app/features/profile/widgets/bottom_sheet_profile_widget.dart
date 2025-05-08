import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/app/features/profile/controllers/profile_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/strings_manager.dart';
import 'circle_shape_profile_widget.dart';

class BottomSheetProfileWidget extends GetView<ProfileController> {
  const BottomSheetProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            StringsManager.profilePhotoText,
          ),
        ),
        const Divider(
          thickness: .5,
        ),
        AppPadding(
          vPadding: 10,
          child: Wrap(
            spacing: 24.w,
            children: [
              CircleShapeProfileWidget(
                  icon: Icons.camera_alt_outlined,
                  title: StringsManager.cameraText,
                  onTap: (){
                    controller.pickImageFromCamera();
                    Get.back();
                  }
              ),
              CircleShapeProfileWidget(
                  icon: Icons.photo_outlined,
                  title: StringsManager.galleryText,
                  onTap: (){
                    controller.pickImageFromGallery();
                    Get.back();
                  }
              ),
              CircleShapeProfileWidget(
                  icon: Icons.delete_outline,
                  title: StringsManager.deleteText,
                  onTap: (){
                    controller.removeImage();
                    Get.back();
                  }
              ),

            ],
          ),
        ),
      ],
    );
  }
}
