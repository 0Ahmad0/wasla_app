import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/widgets/app_padding.dart';
import 'package:wasla_app/core/color_manager.dart';
import 'package:wasla_app/core/extension/space_ext.dart';
import 'package:wasla_app/core/strings_manager.dart';
import 'package:wasla_app/core/style_manager.dart';

import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_item.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(
                    model: controller.pages[index],
                  );
                },
              ),
              SafeArea(
                child: TextButton(
                  onPressed: controller.skip,
                  child: Text(
                    StringsManager.skipText,
                    style: getRegularStyle(
                        color: ColorManager.whiteColor, fontSize: 18),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.pages.length,
                      (index) => Obx(() => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width:
                                controller.currentPage.value == index ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? ColorManager.secondaryColor
                                  : ColorManager.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )),
                    ),
                  ),
                  AppPadding(
                    vPadding: 12,
                    child: ElevatedButton(
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                      ),
                      child: Text(
                        controller.currentPage.value ==
                                controller.pages.length - 1
                            ? StringsManager.startNowText
                            : StringsManager.nextText,
                        style: getRegularStyle(
                            color: ColorManager.whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
