import 'package:flutter/material.dart';

class NotificationModel {
  String title;
  String subtitle;
  String dateTime;
  Color notificationColor;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.notificationColor,
  });
}
