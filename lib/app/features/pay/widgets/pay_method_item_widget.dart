import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/pay/controllers/pay_controller.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/style_manager.dart';
import '../model/payment_method_model.dart';

class PayMethodItemWidget extends GetView<PayController> {
  const PayMethodItemWidget({
    super.key,
    required this.method,
    required this.index,
  });

  final PaymentMethodModel method;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedMethodIndex.value == index;
      return ListTile(
        dense: true,
        onTap: () => controller.selectMethod(index),
        leading: _buildIcon(method.icon),
        title: Text(
          method.title,
          style: getRegularStyle(
            color: ColorManager.textPrimaryColor,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          method.subtitle ?? '',
          style: getLightStyle(color: ColorManager.textSecondaryColor),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: ColorManager.primaryColor,
                size: 34.r,
              )
            : null,
      );
    });
  }

  Widget _buildIcon(
    String path,
  ) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(path);
    } else {
      return Image.asset(path);
    }
  }
}
