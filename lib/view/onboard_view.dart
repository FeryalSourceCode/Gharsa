import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/utils/constants.dart';
import 'package:gharsah_flutter/view/home_view.dart';

import '../components/widgets/introduction.dart';
import '../components/widgets/introscreenonboarding.dart';
import '../helper/auth_manager.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    final List<Introduction> list = [
      const Introduction(
        title: 'Buy & Sell',
        subTitle: 'Browse the menu and order directly from the application',
        imageUrl: Cards.gcard1,
      ),
      const Introduction(
        title: 'Delivery',
        subTitle: 'Your order will be immediately collected and',
        imageUrl: Cards.gcard2,
      ),
      const Introduction(
        title: 'Receive Money',
        subTitle: 'Pick up delivery at your door and enjoy groceries',
        imageUrl: Cards.gcard3,
      ),
      const Introduction(
        title: 'Finish',
        subTitle: 'Browse the menu and order directly from the application',
        imageUrl: Cards.gcard4,
      ),
    ];
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        int isViewed = 0;
        _authManager.onBoardStatus(isViewed);
        Get.off(const HomeView());
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const HomeView(),
        //   ), //MaterialPageRoute
        // );
      },
      // foregroundColor: Colors.red,
    );
  }
}
