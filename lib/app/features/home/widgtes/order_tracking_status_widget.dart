import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../widgets/vertical_stepper/vertical_stepper_model.dart';
import '../../../widgets/vertical_stepper/vertical_stepper_widget.dart';

class OrderTrackingStatusWidget extends StatelessWidget {
  const OrderTrackingStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorManager.chatContainerColor,
          // border: Border.all(
          //     color: ColorManager.notificationDateTimeGrayColor, width: .5),
          borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          8.h.height,
          Text(
            'شكرًا لطلبك🫶',
            textAlign: TextAlign.center,
            style: getBoldStyle(color: ColorManager.primaryColor),
          ),
          2.h.height,
          AppPadding(
            vPadding: 0,
            child: Text(
              'يمكنك متابعة حالة طلبك بسهولة عبر الضغط على الزر أدناه للاطلاع على آخر التحديثات😎',
              textAlign: TextAlign.center,
              style: getLightStyle(
                color: ColorManager.textSecondaryColor,
              ),
            ),
          ),
          Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: ColorManager.transparentColor),
            child: ExpansionTile(
              title: Text("تتبع الطلب"),
              children: [
                VerticalStepperAlternating(
                  currentStep: 1,
                  steps: [
                    StepModel(
                        title: 'تم قبول الطلب',
                        subTitle: 'نقوم الآن بتجهيز الطلب لتحديد وقت الاستلام.',
                        icon: Icons.check),
                    StepModel(
                        title: 'جارٍ تجهيز الطلب بواسطة السائق',
                        subTitle:
                            'بدأنا تجهيز طلبك. سيتم استلامه من قِبل السائق قريبًا.',
                        icon: Icons.delivery_dining),
                    StepModel(
                      title: 'جاهز للتوصيل',
                      subTitle: 'السائق في طريقه لتسليم طلبك.',
                      icon: Icons.incomplete_circle,
                    ),
                  ],
                  completedColor: ColorManager.successColor,
                  currentColor: ColorManager.notificationProgressColor,
                  upcomingColor: ColorManager.notificationDateTimeGrayColor,
                  titleColorActive: ColorManager.primaryColor,
                  circleSize: 50.0,
                ),
                8.h.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
