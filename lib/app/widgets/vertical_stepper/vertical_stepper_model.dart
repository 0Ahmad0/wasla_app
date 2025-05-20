import 'package:flutter/cupertino.dart';

class StepModel {
  final String title;
  final String subTitle;
  final IconData? icon;

  StepModel({
    required this.title,
    required this.subTitle,
    this.icon,
  });
}
