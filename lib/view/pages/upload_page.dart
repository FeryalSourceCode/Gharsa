import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_packages/slide_in_textformfield/slide_in_textformfield.dart';
import '../../controller/upload_controller.dart';

class UploadPage extends StatelessWidget {
  UploadPage({super.key});

  UploadController controller = Get.put(UploadController());
  final cityCtrl = TextEditingController();
  final placeCtrl = TextEditingController();

  showModalBS(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 16.0),
            height: 180.0,
            decoration: BoxDecoration(
              color: AppColors.gWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Upload image from",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.getImage(ImageSource.gallery);
                        // controller.showSnackbar1(context);
                      },
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(30.0, 0, 20.0, 0),
                        width: 70.0,
                        height: 70.0,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: AppColors.feldgrauColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: SvgPicture.asset(
                          AppIcons.gGallery,
                          colorFilter: ColorFilter.mode(
                              AppColors.gWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        controller.getImage(ImageSource.camera);
                      },
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(),
                      child: Container(
                        // margin: const EdgeInsets.fromLTRB(30.0, 0, 20.0, 0),
                        width: 70.0,
                        height: 70.0,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: AppColors.feldgrauColor,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: SvgPicture.asset(
                          AppIcons.gCamera,
                          colorFilter: ColorFilter.mode(
                              AppColors.gWhite, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      extendBody: true,
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        elevation: 0.0,
        toolbarHeight: 60.0,
        leadingWidth: 80,
        leading: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: RawMaterialButton(
            onPressed: () {
              Get.back();
              Get.delete<UploadController>();
            },
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
                  padding: const EdgeInsets.all(7.0),
                  child: SvgPicture.asset(AppIcons.gBack),
                )),
          ),
        ),
        backgroundColor: AppColors.bgColor,
        title: Text(
          "New Post",
          style: TextStyle(color: AppColors.feldgrauColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 16.0),
                child: Text(
                  "You can upload an image for street or land that need plants.",
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
              ),
              DottedBorder(
                color: AppColors.jetStreamColor,
                dashPattern: const [3, 4],
                strokeCap: StrokeCap.round,
                borderType: BorderType.RRect,
                radius: const Radius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    showModalBS(context);
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(30.0, 0, 20.0, 0),
                          width: 50.0,
                          height: 50.0,
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              color: AppColors.feldgrauColor,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: SvgPicture.asset(AppIcons.gUpload),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                              child: Text(
                                "Upload Image            ",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 6.0),
                              child: Text(
                                "Format JPG, PNG, JPEG",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.selectedImagePath.value == ''
                    ? const Text('')
                    : Container(
                        margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
                        child: DottedBorder(
                          color: AppColors.jetStreamColor,
                          dashPattern: const [3, 4],
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.file(
                                    File(controller.cropImagePath.value),
                                    height: 250.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 12.0, 0, 8.0),
                                    child: Text(
                                      "Image Size: ${controller.cropImageSize.value}.",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                child: DottedBorder(
                  color: AppColors.jetStreamColor,
                  dashPattern: const [3, 4],
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10.0),
                  child: CustomDropdown.search(
                      hintText: 'City',
                      controller: cityCtrl,
                      items: controller
                          .getCitiesList() //it waits 3 seconds before start searching (before execute the 'futureRequest' function)
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                child: DottedBorder(
                  color: AppColors.jetStreamColor,
                  dashPattern: const [3, 4],
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10.0),
                  child: CustomDropdown(
                      hintText: 'Place Type',
                      controller: placeCtrl,
                      items: controller
                          .getTypeData() //it waits 3 seconds before start searching (before execute the 'futureRequest' function)
                      ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                child: DottedBorder(
                  color: AppColors.jetStreamColor,
                  dashPattern: const [3, 4],
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10.0),
                  child: Text('')
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
