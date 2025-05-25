import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/app/widgets/dashed_divider_widget.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/color_manager.dart';
import '../enum/orser_status.dart';
import '../model/order_model.dart';

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget({super.key, required this.order});

  final OrderModel order;

  String getStatusText(OrderStatus status) {
    return {
      OrderStatus.accepted: 'تم قبول الطلب',
      OrderStatus.pending: 'قيد الانتظار',
      OrderStatus.rejected: 'تم رفض الطلب',
    }[status]!;
  }

  Color getStatusColor(OrderStatus status) {
    return {
      OrderStatus.accepted: ColorManager.successColor,
      OrderStatus.pending: ColorManager.notificationProgressColor,
      OrderStatus.rejected: ColorManager.errorColor,
    }[status]!;
  }

  String getStatusIcon(OrderStatus status) {
    return {
      OrderStatus.accepted: AssetsManager.checkCircleIcon,
      OrderStatus.pending: AssetsManager.loadingIcon,
      OrderStatus.rejected: AssetsManager.rejectedCircleIcon,
    }[status]!;
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
        key: UniqueKey(),
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                    color: ColorManager.blackColor.withOpacity(.04),
                    offset: Offset(0, 4.sp),
                    blurRadius: 20.sp)
              ]),
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  AssetsManager.myOrdersIcon,
                ),
                title: Text(
                  'الطلب رقم',
                  style: getRegularStyle(
                      color: ColorManager.textPrimaryColor, fontSize: 16),
                ),
                subtitle: Text(
                  '#AF1250H',
                  style: getLightStyle(color: ColorManager.textSecondaryColor),
                ),
                trailing: Icon(Icons.keyboard_arrow_left_sharp),
              ),
              const DashedDividerWidget(
                height: .5,
                dashSpacing: 6,
              ),
              AppPadding(
                vPadding: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'السعر :',
                          style: getRegularStyle(
                              color: ColorManager.textSecondaryColor),
                        ),
                        2.w.width,
                        Text(
                          '${1000}\$',
                          style: getBoldStyle(
                            color: ColorManager.errorColor,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: getStatusColor(order.status).withOpacity(.1),
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                            color: getStatusColor(order.status).withOpacity(.8),
                            width: .5),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            getStatusIcon(order.status),
                          ),
                          4.w.width,
                          Text(
                            getStatusText(order.status),
                            style: getLightStyle(
                              color: getStatusColor(order.status),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
