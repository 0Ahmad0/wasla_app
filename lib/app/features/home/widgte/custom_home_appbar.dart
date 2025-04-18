import 'package:flutter/material.dart';

import '../../../../core/color_manager.dart';

class CustomHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget childW;
  final double height;

  const CustomHomeAppbar({
    super.key,
    this.height = 130,
    required this.childW,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0, end: 34),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return ClipPath(
          clipper: CurvedAppBarClipper(curveHeight: value),
          child: Container(
            height: height,
            color: ColorManager.primaryColor,
            child: SafeArea(child: childW),
          ),
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
