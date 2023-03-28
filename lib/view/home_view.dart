import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/controller/home_controller.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/constants.dart';
import 'package:gharsah_flutter/view/pages/home_page.dart';
import 'package:gharsah_flutter/view/pages/more_page.dart';
import 'package:gharsah_flutter/view/pages/project_page.dart';

import '../controller/navigation_controller.dart';
import 'pages/info_page.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  MainController controller = Get.put(MainController());

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      // switch (notification.direction) {
      //   case ScrollDirection.forward:
      //     controller.hideBottomBarAnimationController.reverse();
      //     controller.fabAnimationController.forward(from: 0);
      //     break;
      //   case ScrollDirection.reverse:
      //     controller.hideBottomBarAnimationController.forward();
      //     controller.fabAnimationController.reverse(from: 1);
      //     break;
      //   case ScrollDirection.idle:
      //     break;
      // }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // final colors = AppColors.bgColor;
    return Obx(
      () => Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            "Hello",
            style: TextStyle(color: Colors.white),
          ),
        ),
        //  body: NotificationListener<ScrollNotification>(
        //   onNotification: onScrollNotification,
        //   child: NavigationScreen(controller.iconList[controller.bottomNavIndex.value]),
        // ),
        body: Obx(() => IndexedStack(
              index: controller.bottomNavIndex.value,
              children: const [
                HomePage(),
                InfoPage(),
                ProjectPage(),
                MorePage()
              ],
            )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.feldgrauColor,
          child: SvgPicture.asset(AppIcons.gIcon, width: 28.0, height: 28.0),
          onPressed: () {
            controller.fabAnimationController.reset();
            // controller.borderRadiusAnimationController.reset();
            // controller.borderRadiusAnimationController.forward();
            controller.fabAnimationController.forward();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: controller.iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? AppColors.feldgrauColor : AppColors.gGray;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  controller.iconList[index],
                  width: 25.0,
                  height: 25.0,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8),
                //   child: AutoSizeText(
                //     "brightness $index",
                //     maxLines: 1,
                //     style: TextStyle(color: color),
                //     group: controller.autoSizeGroup,
                //   ),
                // )
              ],
            );
          },
          activeIndex: controller.bottomNavIndex.value,
          backgroundColor: AppColors.gWhite,
          splashColor: AppColors.mustardYellowColor,
          notchAndCornersAnimation: controller.borderRadiusAnimation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) => controller.bottomNavIndex.value = index,
          hideAnimationController: controller.hideBottomBarAnimationController,
          shadow: BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 12,
            spreadRadius: 0.5,
            color: AppColors.bgColor,
          ),
        ), //other params
      ),
    );
  }
}

class NavigationScreen extends StatelessWidget {
  NavigationController navController = Get.put(NavigationController());
  final String iconData;
  NavigationScreen(this.iconData, {super.key});

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    if (oldWidget.iconData != iconData) {
      navController.startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.bgColor;
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: ListView(
        children: [
          const SizedBox(height: 64),
          Center(
            child: CircularRevealAnimation(
              animation: navController.animation,
              centerOffset: Offset(80, 80),
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child: SvgPicture.asset(
                iconData,
                width: 160.0,
                height: 160.0,
                colorFilter: ColorFilter.mode(
                    AppColors.mustardYellowColor, BlendMode.srcIn),
              ),
              // child: Icon(
              //   Icons.abc,
              //   color: AppColors.mustardYellowColor,
              //   size: 160,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
