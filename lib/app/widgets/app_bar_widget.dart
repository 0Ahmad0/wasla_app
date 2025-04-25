import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wasla_app/app/features/auth/views/login_view.dart';
import 'package:wasla_app/app/widgets/backbutton_widget.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double height;
  final bool showLeadingIcon;

  const AppBarWidget({
    super.key,
    required this.title,
    this.actions,
    this.height = 130,
     this.showLeadingIcon = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(

      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0, end: 34),
      curve: Curves.easeIn,
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: CurvedAppBarClipper(curveHeight: value),
              child: Container(
                height: height,
                color:  ColorManager.primaryColor,
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 22
                    ),
                  ),
                  // Leading
                  Visibility(
                    visible: Navigator.canPop(context),
                    child: PositionedDirectional(
                      start: 12.w,
                      child: BackButtonWidget() ,
                    ),
                  ),
                  // Actions
                  PositionedDirectional(
                    end: 12.w,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions ?? [],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

//********************
class CurvedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  CurvedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveHeight,
      size.width,
      size.height - curveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CurvedAppBarClipper oldClipper) {
    return oldClipper.curveHeight != curveHeight;
  }
}


