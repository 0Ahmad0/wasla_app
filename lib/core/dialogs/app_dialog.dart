import 'package:flutter/material.dart';

class AppDialog {
  final Widget? widget;

  AppDialog({
    this.widget,
  });

  void showAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => widget ?? const SizedBox.shrink(),
    );
  }
}
