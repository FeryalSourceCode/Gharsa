import 'package:get/get.dart';

class PlantInfoController extends GetxController {
  final dataList = [
    {'icon': 'assets/svg/p_leaf.svg', 'text': 'All', 'selected': true},
    {'icon': 'assets/svg/in_p_7.svg', 'text': 'Indoor', 'selected': false},
    {'icon': 'assets/svg/in_p_2.svg', 'text': 'Outdoor', 'selected': false},
    {'icon': 'assets/svg/p_corn4.svg', 'text': 'Crop', 'selected': false},
    {'icon': 'assets/svg/p_flower.svg', 'text': 'Flower', 'selected': false},
    {'icon': 'assets/svg/seed.svg', 'text': 'Seeds', 'selected': false},
  ].obs;

   void setSelectedIndex(int index) {
    for (int i = 0; i < dataList.length; i++) {
      if (i == index) {
        dataList[i]['selected'] = true;
      } else {
        dataList[i]['selected'] = false;
      }
    }
    // update(); // Trigger a rebuild of the widget
  }
}
