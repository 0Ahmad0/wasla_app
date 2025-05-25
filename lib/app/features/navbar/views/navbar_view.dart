import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/color_manager.dart';

import '../../../widgets/app_scaffold_widget.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
      bottomNavigationBar: Obx(
        () => Directionality(
          textDirection: TextDirection.ltr,
          child: BottomBarDoubleBullet(
            color: ColorManager.primaryColor,
            height: 70.0,
            // circle1Color: ColorManager.secondaryColor,
            // circle2Color: ColorManager.textPrimaryColor,
            selectedIndex: controller.index.value,
            items: controller.iconsList
                .map(
                  (e) => BottomBarItem(
                    iconBuilder: (_) => SvgPicture.asset(
                      e,
                      colorFilter: ColorFilter.mode(_, BlendMode.srcIn),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                  ),
                )
                .toList(),
            onSelect: controller.changePage,
          ),
        ),
      ),
    );
  }
}
