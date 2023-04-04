import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      elevation: 0.0,
      color: AppColors.gWhite,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: AppColors.platinum)),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 16.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Chip(
                      label: Text('In progress', style: TextStyle(color: AppColors.gWhite, 
                      fontSize: 12.0,
                      fontFamily: 'Philosopher',),),
                      avatar: SvgPicture.asset('assets/svg/time.svg', width: 16.0, height: 16.0, 
                      colorFilter: ColorFilter.mode(
                            AppColors.jetStreamColor, BlendMode.srcIn),
                      ),
                      backgroundColor: AppColors.feldgrauColor,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'This is the address of the place to plant.',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.mediumJungleGreen,
                          fontFamily: 'tajawal',
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     Row(
                       children: [
                        SvgPicture.asset('assets/svg/user.svg', width: 16.0, height: 16.0, colorFilter: ColorFilter.mode(
                            AppColors.feldgrauColor, BlendMode.srcIn),),
                             const SizedBox(
                          width: 6,
                        ),
                         Text(
                          'User Name',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.gGray,
                              fontFamily: 'Philosopher',
                              fontWeight: FontWeight.w400),
                    ),
                       ],
                     ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/marker.svg',
                                width: 16.0,
                                height: 16.0,
                                colorFilter: ColorFilter.mode(
                                    AppColors.feldgrauColor, BlendMode.srcIn),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Sana\'a',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.feldgrauColor,
                                    fontFamily: 'Philosopher',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/calendar.svg',
                                width: 16.0,
                                height: 16.0,
                                colorFilter: ColorFilter.mode(
                                    AppColors.feldgrauColor, BlendMode.srcIn),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '4/4/2023',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.feldgrauColor,
                                    fontFamily: 'Philosopher',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  color: AppColors.platinum,
                  child: Image.asset(
                    'assets/img/land.jpg',
                    height: 90.0,
                    width: 90.0,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
