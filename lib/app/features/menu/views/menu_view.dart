import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/menu/widgets/menu_item_widget.dart';
import 'package:wasla_app/core/extension/space_ext.dart';

import '../../../../core/strings_manager.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_padding.dart';
import '../controllers/menu_controller.dart';
import '../widgets/menu_containet_widget.dart';

class MenuView extends GetView<MenuAppController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MenuAppController());
    return Scaffold(
      appBar: AppBarWidget(
        title: StringsManager.muneText,
      ),
      body: SingleChildScrollView(
        child: AppPadding(
          vPadding: 10,
          child: Column(
            children: [
              MenuContainerWidget(
                child: Column(
                  children: controller.bloc1Items
                      .map((e) => MenuItemWidget(
                            title: e.title,
                            icon: e.icon,
                            route: e.route,
                          ))
                      .toList(),
                ),
              ),
              10.h.height,
              MenuContainerWidget(
                child: Column(
                  children: controller.bloc2Items
                      .map((e) => MenuItemWidget(
                            title: e.title,
                            icon: e.icon,
                            route: e.route,
                          ))
                      .toList(),
                ),
              ),
              10.h.height,
              MenuContainerWidget(
                child: Column(
                  children: controller.bloc3Items
                      .map((e) => MenuItemWidget(
                            title: e.title,
                            icon: e.icon,
                            route: e.route,
                          ))
                      .toList(),
                ),
              ),
              10.h.height,
              MenuContainerWidget(
                child: Column(
                  children: controller.bloc4Items
                      .map(
                        (e) => MenuItemWidget(
                          title: e.title,
                          icon: e.icon,
                          route: e.route,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
