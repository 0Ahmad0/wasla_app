import 'dart:ui';

import '../../../../core/routes/app_routes.dart';

class MenuItemModel {
  final String title;
  final String icon;
  final String? route;
  final VoidCallback? onTap;

  MenuItemModel({
    required this.title,
    required this.icon,
    this.route = AppRoutes.unknow,
    this.onTap
  });
}
