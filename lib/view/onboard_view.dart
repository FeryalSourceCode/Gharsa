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
    // ignore: no_leading_underscores_for_local_identifiers
    AuthenticationManager _authManager = Get.find();

    final List<Introduction> list = [
      const Introduction(
        title: 'Help Farmers',
        subTitle: 'Help Farmers to plant their farms.',
        imageUrl: Cards.gcard1,
      ),
      const Introduction(
        title: 'Plant a tree',
        subTitle: 'Plant a tree to green the earth',
        imageUrl: Cards.gcard2,
      ),
      const Introduction(
        title: 'Save Environment',
        subTitle: 'By your help, the environment well be saved.',
        imageUrl: Cards.gcard3,
      ),
      const Introduction(
        title: 'Finish',
        subTitle: 'Go to the App and start the plant.',
        imageUrl: Cards.gcard4,
      ),
    ];
    return IntroScreenOnboarding(
      introductionList: list,
      onTapSkipButton: () {
        int isViewed = 0;
        _authManager.onBoardStatus(isViewed);
        Get.off(HomeView());
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
