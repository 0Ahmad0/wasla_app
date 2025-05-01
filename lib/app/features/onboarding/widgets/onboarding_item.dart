import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/features/onboarding/views/onboarding_view.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/style_manager.dart';
import '../../../../core/assets_manager.dart';
import '../model/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          model.image,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorManager.blackColor,
                ColorManager.transparentColor,
              ],
              stops: const [0, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 70.h,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: AppPadding(
              vPadding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: getMediumStyle(
                      color: ColorManager.whiteColor,
                      fontSize: 28
                    ),
                  ),
                  6.h.height,
                  Text(
                    model.description,
                    style: getRegularStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 18
                    ).copyWith(
                      height: 1.75
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
