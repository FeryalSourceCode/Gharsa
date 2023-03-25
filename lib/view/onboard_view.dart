import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/auth_manager.dart';
import 'home_view.dart';
import 'login_view.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? const HomeView() : LoginView();
    });
  }
}
