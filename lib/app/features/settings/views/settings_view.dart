import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/settings/controllers/settings_controller.dart';
import 'package:wasla_app/app/widgets/app_bar_widget.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../../../../core/dialogs/app_bottom_sheet.dart';
import '../../../../core/utils/share_helper.dart';
import '../widgets/bottom_sheet_language_widget.dart';
import '../widgets/bottom_sheet_notifications_widget.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: StringsManager.settingsText),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                AppBottomSheet(widget: const BottomSheetLanguageWidget())
                    .showAppBottomSheet(context);
              },
              dense: true,
              leading: const Icon(Icons.language),
              title: Text(
                StringsManager.languageAppText,
                style: getRegularStyle(
                    color: ColorManager.textPrimaryColor, fontSize: 18),
              ),
              subtitle: Text(
                Get.locale.toString().contains('ar')?StringsManager.arLanguageText:StringsManager.enLanguageText,
                style: getLightStyle(color: ColorManager.textSecondaryColor),
              ),
            ),
            ListTile(
              onTap: () {
                AppBottomSheet(widget: const BottomSheetNotificationsWidget())
                    .showAppBottomSheet(context);
              },
              dense: true,
              leading: const Icon(Icons.notifications_outlined),
              title: Text(
                StringsManager.notificationAppText,
                style: getRegularStyle(
                    color: ColorManager.textPrimaryColor, fontSize: 18),
              ),
              subtitle: Text(
                StringsManager.notificationAppSubtitleText,
                style: getLightStyle(color: ColorManager.textSecondaryColor),
              ),
            ),
            Obx(
              () => ListTile(
                onTap: () => controller.toggleTheme(),
                dense: true,
                leading: AnimatedRotation(
                  turns: controller.isDarkMode.value ? 0 : 1,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut,
                  child: Icon(controller.isDarkMode.value
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                ),
                title: Text(
                  StringsManager.themeAppText,
                  style: getRegularStyle(
                      color: ColorManager.textPrimaryColor, fontSize: 18),
                ),
                subtitle: Text(
                  controller.isDarkMode.value
                      ? StringsManager.themeDarkAppText
                      : StringsManager.themeLightAppText,
                  style: getLightStyle(color: ColorManager.textSecondaryColor),
                ),
              ),
            ),
            ListTile(
              onTap: () => ShareHelper.shareAppWithImage(),
              dense: true,
              leading: const Icon(Icons.share),
              title: Text(
                StringsManager.shareAppText,
                style: getRegularStyle(
                    color: ColorManager.textPrimaryColor, fontSize: 18),
              ),
              subtitle: Text(
                StringsManager.shareAppSubtitleText,
                style: getLightStyle(color: ColorManager.textSecondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
