import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/general_dialog.dart';

class DeleteProductFromCartDialog extends StatelessWidget {
  const DeleteProductFromCartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralAppDialog(
      title: 'هل تريد بالتأكيد حذف المنتج من السلة؟',
      okText: 'حذف',
      cancelText: 'لا',
      okOnTap: ()=>Get.back(result:  true),
      cancelOnTap: ()=>Get.back(result:  false),
      okColor: ColorManager.errorColor,
      generalColor: ColorManager.errorColor,
      icon: AssetsManager.cartDeleteIcon,
    );
  }
}
