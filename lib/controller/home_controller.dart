// ignore_for_file: unnecessary_overrides

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/utils/constants.dart';

class MainController extends GetxController
    with GetTickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var bottomNavIndex = 0.obs; //default index of a first screen

  late AnimationController fabAnimationController;
  late AnimationController borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController hideBottomBarAnimationController;

  final iconList = <String>[
    AppIcons.gHome,
    AppIcons.gPlant,
    AppIcons.gProject,
    AppIcons.gMore,
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => borderRadiusAnimationController.forward(),
    );
  }

  void changeTabIndex(int index) {
    bottomNavIndex.value = index;
  }

  @override
  void dispose() {
    super.dispose();
  }
}


