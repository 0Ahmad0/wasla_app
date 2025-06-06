import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/pay/controllers/pay_controller.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';
import '../widgets/pay_method_item_widget.dart';

class PayView extends GetView<PayController> {
  const PayView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBarWidget(
        title: StringsManager.payMethodText,
        actions: [
          IconButton(
            tooltip: StringsManager.addPaymentMethodText,
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: ColorManager.whiteColor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: controller.paymentMethods.length,
              itemBuilder: (context, index) {
                final method = controller.paymentMethods[index];

                return PayMethodItemWidget(
                  index: index,
                  method: method,
                );
              },
            ),
          ),
          AppPadding(
            vPadding: 10,
            child: AppButtonWidget(
              text: "تحديد طريقة الدفع",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
