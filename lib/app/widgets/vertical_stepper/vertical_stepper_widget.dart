// Vertical Stepper Widget with Alternating Text and Advanced Customization

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/widgets/vertical_stepper/vertical_stepper_model.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'dart:math';

import 'package:wasla_app/core/style_manager.dart';

import 'custom_line_widget.dart';
import 'loading_dots_widget.dart';

class VerticalStepperAlternating extends StatelessWidget {
  final List<StepModel> steps;
  final int currentStep;
  final Color completedColor;
  final Color currentColor;
  final Color upcomingColor;

  //
  final Color titleColorActive;
  final Color titleColorNotActive;

  final Color subTitleColorActive;
  final Color subTitleColorNotActive;

  //
  final double circleSize;

  const VerticalStepperAlternating({
    super.key,
    required this.steps,
    required this.currentStep,
    this.completedColor = Colors.green,
    this.currentColor = Colors.orange,
    this.upcomingColor = Colors.grey,
    this.circleSize = 40.0,
    this.titleColorActive = Colors.black,
    this.titleColorNotActive = Colors.grey,
    this.subTitleColorActive = Colors.black54,
    this.subTitleColorNotActive = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final isCompleted = index < currentStep;
        final isCurrent = index == currentStep;
        final step = steps[index];

        Color circleColor = upcomingColor;
        if (isCompleted) circleColor = completedColor;
        if (isCurrent) circleColor = currentColor;

        bool isLeft = index.isEven;

        final stepContent = Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(step.title,
                textAlign: isLeft ? TextAlign.end : TextAlign.start,
                style: getBoldStyle(
                  color: isCompleted || isCurrent
                      ? titleColorActive
                      : titleColorNotActive,
                )),
            4.h.height,
            Text(step.subTitle,
                textAlign: isLeft ? TextAlign.end : TextAlign.start,
                style: getLightStyle(
                  color: isCompleted || isCurrent
                      ? subTitleColorActive
                      : subTitleColorNotActive,
                )),
          ],
        );

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isLeft
                ? [
                    Expanded(child: stepContent),
                    8.w.width,
                    Column(
                      children: [
                        _buildIndicator(step.icon, circleColor, isCurrent),
                        if (index != steps.length - 1)
                          CustomLine(
                            color: index < currentStep - 1
                                ? completedColor
                                : index == currentStep - 1
                                    ? completedColor
                                    : upcomingColor,
                            isDashed: index >= currentStep,
                            height: 40.h,
                          ),
                      ],
                    ),
                    8.w.width,
                    const Spacer(),
                  ]
                : [
                    const Spacer(),
                    8.w.width,
                    Column(
                      children: [
                        _buildIndicator(step.icon, circleColor, isCurrent),
                        if (index != steps.length - 1)
                          CustomLine(
                            color: index < currentStep - 1
                                ? completedColor
                                : index == currentStep - 1
                                    ? completedColor
                                    : upcomingColor,
                            isDashed: index >= currentStep,
                            height: 40.h,
                          ),
                      ],
                    ),
                    8.w.width,
                    Expanded(child: stepContent),
                  ],
          ),
        );
      }),
    );
  }

  Widget _buildIndicator(IconData? icon, Color color, bool isCurrent) {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isCurrent
            ? const LoadingDots()
            : Icon(
                icon,
                color: Colors.white,
                size: circleSize * 0.5,
              ),
      ),
    );
  }
}
