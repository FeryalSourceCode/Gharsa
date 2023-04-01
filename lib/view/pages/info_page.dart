import 'package:flutter/material.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/view/pages/plant_bank_information.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.gWhite,
        appBar: AppBar(
          backgroundColor: AppColors.gWhite,
          elevation: 0,
          title: Text(
            'plant bank',
            style: TextStyle(color: AppColors.rifleGreenColor),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 25, right: 10, left: 10),
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (_, index) {
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.culturedGray,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          // color: AppColors.gWhite,
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColors.gWhite,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage("assets/img/laila1.jpeg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('dkjh'),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    int myId=1;
                    var router =
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>plant_bank_information('laila'));
                 Navigator.of(context).push(router); },
                );
              }),
        ));
  }
}
