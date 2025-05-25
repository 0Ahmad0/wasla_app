import 'package:flutter/material.dart';

class AppDialog {
  final Widget? widget;

  AppDialog({
    this.widget,
  });

  Future<bool?> showAppDialog(BuildContext context) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => widget ?? const SizedBox.shrink(),
    );
  }
}
