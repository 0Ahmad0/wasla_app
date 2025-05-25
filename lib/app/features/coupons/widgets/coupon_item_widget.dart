import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wasla_app/app/features/coupons/controllers/coupons_controller.dart';
import 'package:wasla_app/app/features/coupons/widgets/success_applied_coupon_dialog_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/assets_manager.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/dialogs/app_dialog.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class CouponItemWidget extends GetView<CouponsController> {
  final int discount;
  final List<Color> gradientColors;

  const CouponItemWidget({
    super.key,
    required this.discount,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CouponClipper(),
      child: Container(
        width: 260.w,
        height: 180.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AssetsManager.couponBackgroundIMG),
          ),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppPadding(
          vPadding: 2,
          hPadding: 18,
          child: Column(
            children: [
              const Spacer(),
              FittedBox(child: SvgPicture.asset(AssetsManager.waslaNameIMG)),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: '${discount}',
                    style: getBoldStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 80.sp,
                    ).copyWith(fontFamily: GoogleFonts.roadRage().fontFamily),
                  ),
                  TextSpan(
                    text: '%',
                    style: getRegularStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 40.sp,
                    ).copyWith(fontFamily: GoogleFonts.roadRage().fontFamily),
                  ),
                ]),
              ),
              Text(
                StringsManager.discountText,
                style: getRegularStyle(
                  color: ColorManager.whiteColor,
                  fontSize: 30.sp,
                ),
              ),
              const Spacer(flex: 4),
              Divider(color: ColorManager.whiteColor),
              const Spacer(),
              TextButton(
                onPressed: () {
                  controller.showFireworks();
                  AppDialog(
                    widget: SuccessAppliedCouponDialogWidget(
                      discount: discount,
                    ),
                  ).showAppDialog(context);
                },
                child: Text(
                  StringsManager.useText,
                  style: getRegularStyle(
                    color: ColorManager.whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

//************
class CouponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 12;
    double notchRadius = 20;
    double notchHeight = 1.35;

    Path path = Path();

    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // notch على اليمين
    path.lineTo(size.width, size.height / notchHeight - notchRadius);
    path.arcToPoint(
      Offset(size.width, size.height / notchHeight + notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // notch على اليسار
    path.lineTo(0, size.height / notchHeight + notchRadius);
    path.arcToPoint(
      Offset(0, size.height / notchHeight - notchRadius),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );

    path.lineTo(0, radius);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
