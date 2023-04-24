import 'package:get/get.dart';
import 'package:gharsah_flutter/view/pages/plant_bank_info_details.dart';
import 'package:gharsah_flutter/view/pages/project_details_page.dart';

class HomeController extends GetxController {

  void openPlantDetails(int plantId) {
    Get.to(PlantBankInfoDetails(plantId: plantId));
  }

   void openProjectDetails(int projectId) {
    Get.to(ProjectDetails(projectId: projectId));
  }
}
