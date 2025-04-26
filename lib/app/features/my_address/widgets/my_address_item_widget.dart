import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wasla_app/app/features/my_address/model/my_address_model.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/date_time_ext.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

class MyAddressItemWidget extends StatelessWidget {
  const MyAddressItemWidget({
    super.key,
    required this.index,
    required this.address,
  });

  final int index;
  final MyAddressModel address;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: ColorManager.chatContainerColor,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
                radius: 14.sp,
                child: Text(
                  '${index + 1}',
                  style: getLightStyle(color: ColorManager.whiteColor),
                ),
              ),
              8.w.width,
              Expanded(
                child: Text(
                  address.title,
                  maxLines: 2,
                  style: getBoldStyle(color: ColorManager.primaryColor),
                ),
              ),
              8.w.width,
              Icon(Icons.location_on_rounded,color: ColorManager.errorColor,)
            ],
          ),
          4.h.height,
          Text(
            address.subtitle,
            style: getRegularStyle(color: ColorManager.textSecondaryColor),
          ),
          8.h.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat.yMMMMEEEEd(Get.locale?.languageCode).format(
                  DateTime.parse(
                    address.dateSelected,
                  ),
                ),
                style: getLightStyle(
                  color: ColorManager.primaryColor,
                  fontSize: 10
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
