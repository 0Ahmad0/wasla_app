import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasla_app/core/strings_manager.dart';

import '../controllers/settings_controller.dart';

class BottomSheetLanguageWidget extends GetView<SettingsController> {
  const BottomSheetLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
            ),
          ),
          title: const Text(
            StringsManager.languageAppText,
          ),
        ),
        const Divider(
          thickness: .5,
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: const Text(StringsManager.arLanguageText),
          value: 'ar',
          groupValue: controller.selectedLanguage.value,
          onChanged: (value) => controller.changeLanguage(value!),
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: const Text(StringsManager.enLanguageText),
          value: 'en',
          groupValue: controller.selectedLanguage.value,
          onChanged: (value) => controller.changeLanguage(value!),
        ),
      ],
    ));
  }
}
