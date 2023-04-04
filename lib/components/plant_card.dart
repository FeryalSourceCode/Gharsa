import 'package:flutter/material.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.gWhite,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: AppColors.platinum)),
      margin: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              // color: AppColors.gWhite,
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.gWhite,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/plant3.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 6.0),
            child: Text(
              'POTHOS(Epipremnum aureum)',
              maxLines: 2,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.mediumJungleGreen,
                  fontFamily: 'tajawal',
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
