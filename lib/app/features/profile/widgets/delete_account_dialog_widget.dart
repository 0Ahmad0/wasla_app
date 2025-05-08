import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/general_dialog.dart';
import 'package:wasla_app/core/routes/app_routes.dart';

class DeleteAccountDialogWidget extends StatelessWidget {
  const DeleteAccountDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralAppDialog(
      title: 'هل تريد بالفعل حذف حسابك ☹️ !',
      generalColor: ColorManager.errorColor,
      okText: 'حذف الحساب',
      icon: AssetsManager.profileIcon,
      okOnTap: ()=>Get.offAllNamed(AppRoutes.login),
    );
  }
}
