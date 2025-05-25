import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasla_app/app/features/auth/views/forget_password_view.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/color_manager.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({
    super.key,
    required int currentIndex,
    required this.index,
    required this.list,
    this.totalCount, this.onTap,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;
  final int index;
  final int? totalCount;
  final List list;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
            color: _currentIndex == index
                ? ColorManager.primaryColor
                : ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: _currentIndex == index
                ? null
                : Border.all(color: ColorManager.border, width: 1.sp)),
        duration: const Duration(milliseconds: 300),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            list[index].icon == null
                ? SizedBox.shrink()
                : SvgPicture.asset(
                    list[index].icon!,
                    colorFilter: ColorFilter.mode(
                        _currentIndex == index
                            ? ColorManager.whiteColor
                            : ColorManager.hintTextColor,
                        BlendMode.srcIn),
                  ),
            4.w.width,
            Text(
              list[index].name,
              style: getMediumStyle(
                color: _currentIndex == index
                    ? ColorManager.whiteColor
                    : ColorManager.hintTextColor,
              ),
            ),
            4.w.width,
            Text(
              '(${totalCount ?? 0})',
              style: getMediumStyle(
                  color: _currentIndex == index
                      ? ColorManager.whiteColor
                      : ColorManager.hintTextColor,
                  fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
