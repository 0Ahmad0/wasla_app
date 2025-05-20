// Vertical Stepper Widget with Alternating Text and Advanced Customization

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla_app/app/widgets/vertical_stepper/vertical_stepper_model.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'dart:math';

import 'package:wasla_app/core/style_manager.dart';

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

class CustomLine extends StatelessWidget {
  final Color color;
  final bool isDashed;
  final double height;

  const CustomLine({
    super.key,
    required this.color,
    required this.isDashed,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: LinePainter(color: color, isDashed: isDashed),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Color color;
  final bool isDashed;

  LinePainter({required this.color, required this.isDashed});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.75;

    if (isDashed) {
      const dashHeight = 5.0;
      const dashSpace = 5.0;
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(Offset(size.width / 2, startY),
            Offset(size.width / 2, startY + dashHeight), paint);
        startY += dashHeight + dashSpace;
      }
    } else {
      canvas.drawLine(Offset(size.width / 2, 0),
          Offset(size.width / 2, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    _animation = Tween<double>(begin: 0, end: 3).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) {
        int dotCount = _animation.value.floor() + 1;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: index < dotCount ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
