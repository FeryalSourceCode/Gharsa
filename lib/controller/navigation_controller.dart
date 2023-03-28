import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController with GetTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

@override
  void onInit() {
    super.onInit();

     controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    controller.forward();
  }

   startAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    controller.forward();
  }

   @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}
