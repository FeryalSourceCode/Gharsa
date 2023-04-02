import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/controller/forline_controller.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/upload_controller.dart';

// ignore: must_be_immutable
class UploadPage extends StatelessWidget {
  UploadPage({super.key});

  UploadController controller = Get.put(UploadController());

  final cityCtrl = TextEditingController();
  final placeCtrl = TextEditingController();

  void _onIncrementPressed() {
    controller.increment();
  }

  void _onDecrementPressed() {
    controller.decrement();
  }

  int maxLines = 4;

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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        .getTypeList(), //it waits 3 seconds before start searching (before execute the 'futureRequest' function)
                    onChanged: (p0) {},
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
                  child: Container(
                    color: AppColors.gWhite,
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                    clipBehavior: Clip.none,
                    child: Expanded(
                      // child: LimitedBox(
                      // maxHeight: 3 * (const TextField().style?.fontSize ?? 14) * 1.5,
                      child: FourLineTextField(),
                    ),
                  ),
                ),
              ),
              // The name of the crop you want to plant
              const Padding(
                padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 12.0),
                child: Text(
                  "The name of the crop you want to plant.",
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
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
                  child: Container(
                    color: AppColors.gWhite,
                    padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    clipBehavior: Clip.none,
                    child: const PlantTextField(),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 12.0),
                child: Text(
                  "The number of the plants.",
                  style: TextStyle(fontSize: 14.0, color: Colors.black54),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: controller.decrement,
                      onLongPress: controller.decrement,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.feldgrauColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12),
                        ),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 30),
                    Obx(
                      () => Text(
                        '${controller.count}',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: controller.increment,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.feldgrauColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12),
                        ),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: controller.decrement,
                onLongPress: controller.decrement,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.feldgrauColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(12),
                  ),
                ),
                child: const Text("Create", style: TextStyle(fontSize: 16.0),),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantTextField extends StatelessWidget {
  const PlantTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      textAlign: TextAlign.start,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Crop Name',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true),
      textAlignVertical: TextAlignVertical.top,
    );
  }
}

class FourLineTextField extends GetView<FourLineTextFieldController> {
  @override
  FourLineTextFieldController controller =
      Get.put(FourLineTextFieldController());

  FourLineTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textEditingController,
      enabled: controller.isEnabled.value,
      minLines: 2,
      maxLines: 4,
      textAlign: TextAlign.start,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: const InputDecoration(
          // border: UnderlineInputBorder(),
          border: InputBorder.none,
          hintText: 'Address Description',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true),
      textAlignVertical: TextAlignVertical.top,
    );

    // TextField(
    //   controller: controller.textEditingController,
    //   enabled: controller.isEnabled.value,
    //   maxLines: 4,
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(),
    //     hintText: 'Type here, up to 4 lines',
    //   ),
    // );
  }
}
