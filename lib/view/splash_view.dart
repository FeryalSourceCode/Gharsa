import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/auth_manager.dart';
import 'login_view.dart';
import 'onboard_view.dart';

class SplashView extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

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
              return const OnBoardView();
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
    backgroundColor: Colors.cyan,
    body: Center(
      child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Lottie.asset('assets/water3.json')),
    ),
  );
}
