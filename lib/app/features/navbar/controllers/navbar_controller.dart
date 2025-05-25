import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/home/views/home_view.dart';
import 'package:wasla_app/app/features/menu/views/menu_view.dart';
import 'package:wasla_app/app/features/my_orders/views/my_orders_view.dart';
import 'package:wasla_app/app/features/notifications/views/notification_view.dart';
import 'package:wasla_app/app/features/profile/views/profile_view.dart';
import 'package:wasla_app/core/assets_manager.dart';

import '../../search/views/search_view.dart';

class NavbarController extends GetxController {
  RxInt index = 4.obs;

  void changePage(int index) {
    this.index.value = index;
  }

  final List<Widget> pages = [
    MenuView(),
    ProfileView(),
    MyOrdersView(),
    SearchView(),
    HomeView(),
  ];
  final List<String> iconsList = [
    AssetsManager.menuIcon,
    AssetsManager.profileIcon,
    AssetsManager.myOrdersIcon,
    AssetsManager.searchIcon,
    AssetsManager.homeIcon,
  ];
}
