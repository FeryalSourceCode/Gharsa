import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharsah_flutter/components/project_card.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/constants.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

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
        title: Text(
          "All projects",
          style: TextStyle(
              color: AppColors.feldgrauColor,
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 28.0),
          child: Column(children: [
             ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ProjectCard();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
