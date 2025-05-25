import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    super.key,
    this.hPadding = 24.0,
    this.vPadding = 24.0,
    this.child,
  });

  final double hPadding;
  final double vPadding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: hPadding.w, vertical: vPadding.h),
      child: child,
    );
  }
}
