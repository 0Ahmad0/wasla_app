import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/check_out/controllers/check_out_controller.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_button_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/routes/app_routes.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';
import '../widgets/checkout_title_widget.dart';
import '../widgets/confirm_pay_dialog_widget.dart';

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarWidget(
        title: StringsManager.checkOutText,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: AppPadding(
              vPadding: 10,
              hPadding: 12,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.chatContainerColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.cart);
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.shopping_bag,
                        color: ColorManager.primaryColor,
                      ),
                      title: Text.rich(
                        TextSpan(children: [
                          const TextSpan(text: 'الطلبية رقم' + ' '),
                          TextSpan(
                            text: '(${7} عناصر)',
                            style: getLightStyle(
                                color: ColorManager.ratingColor, fontSize: 10),
                          ),
                        ]),
                      ),
                      subtitle: Text(
                        '#F67SVCJ9812',
                        style: getRegularStyle(
                            color: ColorManager.textSecondaryColor,
                            fontSize: 12),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_left_sharp,
                      ),
                    ),
                  ),
                  8.h.height,
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.chatContainerColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.coupons);
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.discount,
                        color: ColorManager.primaryColor,
                      ),
                      title: Text('كوبون الخصم'),
                      subtitle: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: 'حصلت على خصم' + ' ',
                            style: getLightStyle(
                              color: ColorManager.textSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '10%',
                            style: getLightStyle(
                              color: ColorManager.errorColor,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                      ),
                      trailing: const Icon(Icons.edit_outlined),
                    ),
                  ),
                  8.h.height,
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.chatContainerColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.myAddress);
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.location_on_rounded,
                        color: ColorManager.primaryColor,
                      ),
                      title: Text('موقع التوصيل'),
                      subtitle: Text(
                        'البيت , درعا الصورة طريق الغارية',
                        style: getRegularStyle(
                          color: ColorManager.textSecondaryColor,
                        ),
                      ),
                      trailing: const Icon(Icons.edit_outlined),
                    ),
                  ),
                  8.h.height,
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.chatContainerColor,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.pay);
                      },
                      dense: true,
                      leading: const Icon(
                        Icons.credit_card,
                        color: ColorManager.primaryColor,
                      ),
                      title: Text('طريقة الدفع'),
                      subtitle: Text(
                        'الدفع عن طريق سيرياتيل كاش',
                        style: getRegularStyle(
                          color: ColorManager.textSecondaryColor,
                        ),
                      ),
                      trailing: const Icon(Icons.edit_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: ColorManager.chatContainerColor,
            ),
            child: Column(
              children: [
                CheckOutTitleWidget(
                  title: StringsManager.subtotalCheckOutText,
                  amount: '${1000}',
                ),
                8.h.height,
                CheckOutTitleWidget(
                  title: StringsManager.deliveryChargesCheckOutText,
                  amount: '${30}',
                ),
                8.h.height,
                CheckOutTitleWidget(
                  title: StringsManager.couponDiscountCheckOutText,
                  amount: '${22}',
                  amountColor: ColorManager.errorColor,
                ),
                8.h.height,
                CheckOutTitleWidget(
                  title: StringsManager.totalCheckOutText,
                  amount: '${1008}',
                  titleColor: ColorManager.primaryColor,
                ),
                12.h.height,
                AppButtonWidget(
                  text: StringsManager.payText + '  20\$',
                  onPressed: () {
                    AppDialog(
                      widget: ConfirmPayDialogWidget(),
                    ).showAppDialog(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
