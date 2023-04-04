import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/controller/home_controller.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/constants.dart';
import 'package:gharsah_flutter/view/pages/home_page.dart';
import 'package:gharsah_flutter/view/pages/more_page.dart';
import 'package:gharsah_flutter/view/pages/project_page.dart';
import 'package:gharsah_flutter/view/pages/upload_page.dart';
import 'pages/info_page.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // final colors = AppColors.bgColor;
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.bottomNavIndex.value,
          children: [HomePage(), const InfoPage(), const ProjectPage(), const MorePage()],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.feldgrauColor,
          child: SvgPicture.asset(AppIcons.gIcon, width: 28.0, height: 28.0),
          onPressed: () {
            Get.to(UploadPage());
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
            blurRadius: 5,
            spreadRadius: 0.1,
            color: AppColors.bgColor,
          ),
        ), //other params
      ),
    );
  }
}
