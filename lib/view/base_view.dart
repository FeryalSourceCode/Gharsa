import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/auth_manager.dart';
import 'home_view.dart';
import 'onboard_view.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      // return _authManager.isLogged.value ? const HomeView() : LoginView();
      // final screenHeight = MediaQuery.of(context).size.height;
      return _authManager.isViewed.value == 0
          ? HomeView()
          // : OnBoardView(screenHeight: screenHeight);
          : const OnBoardView();
    });
  }
}
