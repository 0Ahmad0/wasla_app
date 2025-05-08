import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasla_app/app/features/home/controllers/home_controller.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class CarouselHomeItemWidget extends GetView<HomeController> {
  const CarouselHomeItemWidget({
    super.key,
    required this.imageURL,
    required this.text,
  });

  final String imageURL;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(
            width: double.maxFinite,
            height: 200.h,
            imageURL,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.hardLight,
            color: ColorManager.blackColor.withOpacity(.45),
          ),
          Container(
            width: double.maxFinite,
            height: 200.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorManager.blackColor.withOpacity(0.05),
                  // الأعلى: شفاف تقريبًا
                  ColorManager.blackColor.withOpacity(0.05),
                  // الأسفل: شبه معتم
                  ColorManager.blackColor.withOpacity(0.25),
                  // الأسفل جدًا: معتم أكثر
                ],
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: AppPadding(
              vPadding: 10,
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: getRegularStyle(
                    color: ColorManager.whiteColor, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
