import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutController extends GetxController{
  RxInt animationIndex = 0.obs;

  // قائمة الأنميشنات باستخدام animated_do
  final List<Widget Function(Widget)> animations = [
        (child) => child.fadeIn(),
        (child) => child.fadeInDown(),
        (child) => child.fadeInDownBig(),
        (child) => child.fadeInUp(),
        (child) => child.fadeInUpBig(),
        (child) => child.fadeInLeft(),
        (child) => child.fadeInLeftBig(),
        (child) => child.fadeInRight(),
        (child) => child.fadeInRightBig(),
        (child) => child.bounceInDown(),
        (child) => child.bounceInUp(),
        (child) => child.bounceInLeft(),
        (child) => child.bounceInRight(),
        (child) => child.elasticIn(),
        (child) => child.elasticInDown(),
        (child) => child.elasticInUp(),
        (child) => child.elasticInLeft(),
        (child) => child.elasticInRight(),
        (child) => child.slideDown(),
        (child) => child.slideUp(),
        (child) => child.slideInLeft(),
        (child) => child.slideInRight(),
        (child) => child.backInDown(),
        (child) => child.backInUp(),
        (child) => child.backInLeft(),
        (child) => child.backInRight(),
        (child) => child.flipInX(),
        (child) => child.flipInY(),
        (child) => child.zoomIn(),
        (child) => child.bounce(),
        (child) => child.dance(),
        (child) => child.flash(),
        (child) => child.pulse(),
        (child) => child.roulette(),
        (child) => child.shakeX(),
        (child) => child.shakeY(),
        (child) => child.spin(),
        (child) => child.spinPerfect(),
        (child) => child.swing(),
        (child) => child.heartBeat(),
        (child) => child.wobble(),
        (child) => child.jello(),
        (child) => child.tada(),
        (child) => child.rubberBand(),
  ];


  void onClickLogo() {
    animations.shuffle();
    animationIndex.value = (animationIndex.value + 1) % animations.length;
  }
}