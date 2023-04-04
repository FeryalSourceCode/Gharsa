import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharsah_flutter/components/plant_card.dart';
import 'package:gharsah_flutter/components/project_card.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final projectItems = List<String>.generate(2, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0.0,
        toolbarHeight: 60.0,
        leadingWidth: 80,
        leading: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 0.0,
            shape: const CircleBorder(),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.gWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(AppIcons.gSearch),
                )),
          ),
        ),
        backgroundColor: AppColors.bgColor,
        title: Image.asset(
          AppIcons.gLogoName,
          width: 90.0,
          height: 90.0,
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 1.0),
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 0.0,
              shape: const CircleBorder(),
              child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gWhite,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      AppIcons.gNotifaication,
                      width: 24.0,
                      height: 24.0,
                    ),
                  )),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120.0,
              margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Stack(
                children: [
                  Card(
                    margin: const EdgeInsets.only(top: 25),
                    elevation: 0.0,
                    color: AppColors.beigeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: AppColors.EggshellColor,
                      ),
                    ),
                    child: Container(
                        width: double.infinity,
                        height: 100.0,
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                        child: Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Today\'s Tip',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.mustardYellowColor,
                                    fontFamily: 'tajawal',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Plant a tree For Life.',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.mediumJungleGreen,
                                    fontFamily: 'Philosopher',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    right: 0,
                    top: -8,
                    // child:
                    // Image.asset(
                    //   'assets/img/leaves.png',
                    //   width: 120.0,
                    //   height: 120.0,
                    // ),
                    child: SvgPicture.asset(
                      'assets/svg/leaf.svg',
                      width: 120.0,
                      height: 120.0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/section6.svg',
                            width: 18.0,
                            height: 18.0,
                            colorFilter: ColorFilter.mode(
                                AppColors.jetStreamColor, BlendMode.srcIn),
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            'Current Project',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.mediumJungleGreen,
                                fontFamily: 'Philosopher',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        'Show All',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.jetStreamColor,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return const ProjectCard();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/section6.svg',
                            width: 18.0,
                            height: 18.0,
                            colorFilter: ColorFilter.mode(
                                AppColors.jetStreamColor, BlendMode.srcIn),
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            'Plants',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.mediumJungleGreen,
                                fontFamily: 'Philosopher',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        'Show All',
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.jetStreamColor,
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GridView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          child: const PlantCard(),
                          onTap: () {},
                        );
                      }),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
