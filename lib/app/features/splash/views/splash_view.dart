import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wasla_app/app/features/splash/controllers/splash_controller.dart';

import '../../../widgets/app_scaffold_widget.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    Get.lazyPut(() => SplashController());
    return CustomScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/splash_background.svg',
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeInUp(
                child: SvgPicture.asset(
                  'assets/images/wasla_name.svg',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
