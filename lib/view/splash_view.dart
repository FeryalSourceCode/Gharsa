import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

import '../helper/auth_manager.dart';
import 'base_view.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  SplashView({super.key});

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();
    _authmanager.checkOnBoardStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  //SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else {
            if (snapshot.hasError) {
              return errorView(snapshot);
            } else {
              return const BaseView();
            }
          }
        });
  }
}

Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
  return Scaffold(
    body: Center(
      child: Text('Error: ${snapshot.error}'),
    ),
  );
}

Scaffold waitingView() {
  return Scaffold(
    backgroundColor: AppColors.culturedGray,
    body: Stack(children: [
      Positioned(
        left: -100,
        top: -70,
        child: SizedBox(
            width: 350.0,
            height: 350.0,
            child: Image.asset(
              "assets/img/logo_gray.png",
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate,
            )),
      ),
      Center(
        child: SizedBox(
            width: 220.0,
            height: 220.0,
            child: Image.asset("assets/img/gharsa_logo.png")),
      ),
      Positioned(
        right: -100,
        bottom: -80,
        child: SizedBox(
            width: 350.0,
            height: 350.0,
            child: Image.asset(
              "assets/img/logo_gray.png",
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate,
            )),
      ),
    ]),
  );
}
