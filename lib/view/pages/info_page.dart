import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gharsah_flutter/components/plant_card.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

import '../../utils/constants.dart';
// import 'package:gharsah_flutter/view/pages/plant_bank_information.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

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
          title: Text("Plant Bank", style: TextStyle(color: AppColors.feldgrauColor, 
          fontFamily: 'Philosopher', fontWeight: FontWeight.bold
            ),),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 25, right: 10, left: 10, top: 6),
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (_, index) {
                return InkWell(
                  child: const PlantCard(),
                  onTap: () {
                    // int myId=1;
                    var router =
                         MaterialPageRoute(
                            builder: (BuildContext context) =>const plant_bank_information('laila'));
                 Navigator.of(context).push(router); },
                );
              }),
        ));
  }
}

// ignore: camel_case_types
class plant_bank_information extends StatelessWidget {

final String id;
const plant_bank_information(this.id, {super.key}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.gWhite,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.brown),
          onPressed: (){
            Navigator.of(context).pop();
          },



        ),
        title: Text(
          'Plants Information',
          style: TextStyle(color: AppColors.rifleGreenColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage("assets/img/laila1.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(itemCount: 4,
                  scrollDirection: Axis.horizontal,itemBuilder: (_,i){
                return Container(
                  margin: const EdgeInsets.only(top: 5,bottom:5,right: 10),
                  // color: AppColors.gWhite,
                  height: 80,
                  width: 80,
                  decoration:BoxDecoration(
                      color: AppColors.gWhite,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/img/laila1.jpeg"),
                        fit:BoxFit.cover,
                      )
                  ),
                );
              }),
            ),
            Text(
              'Turbary',
              style: TextStyle(
                  color: AppColors.rifleGreenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: const Text(
                  'Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary Turbary'),
            ),
            Text('Recommendation',
                style: TextStyle(
                    color: AppColors.rifleGreenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    buildDiv(Colors.lightBlue, Icons.water,
                        'Watering every', '12hr'),
                    buildDiv(Colors.amber, Icons.sunny,
                        'Light', '5,8k lux'),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Text(
                            '200ml',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            'fkjuhfg',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    buildDiv(Colors.lightGreenAccent, Icons.wind_power_sharp,
                        'wind', '10m/h'),
                  ],
                ),
                Column(
                  children: [
                    buildDiv(Colors.deepPurpleAccent, Icons.hot_tub,
                        '', '16C'),
                    buildDiv(Colors.lightBlueAccent, Icons.water_drop,
                        'Humidity', '76%'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppColors.dollarGreenColor)),
          child: const Text('Add to My Plants'),
          onPressed: () {

          },
        ),
      )),
    );
  }
}

Column buildDiv(Color mycolor, IconData myIcon, String title, String subtitle) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: mycolor, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(5),
            child: Icon(
              size: 15,
              myIcon,
              color: AppColors.gWhite,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  '$title',
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  '$subtitle',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}


