import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/check_out/widgets/success_payment_dialog_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/dialogs/general_dialog.dart';

class ConfirmPayDialogWidget extends StatelessWidget {
  const ConfirmPayDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralAppDialog(
      title: 'هل إنت متأكد من الاستمرار في العملبة؟',
      generalColor: ColorManager.ratingColor,
      icon: AssetsManager.menuPayIcon,
      okText: 'استمرار',
      okOnTap: () {
        Get.back();
        AppDialog(
          widget: SuccessPaymentDialogWidget(),
        ).showAppDialog(
          context,
        );
      },
    );
  }
}
