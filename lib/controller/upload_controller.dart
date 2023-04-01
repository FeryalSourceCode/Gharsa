import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharsah_flutter/components/src/awesome_snackbar_content.dart';
import 'package:gharsah_flutter/model/type_model.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';
import 'package:gharsah_flutter/utils/app_text_styles.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadController extends GetxController with GetSingleTickerProviderStateMixin {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var cropImagePath = ''.obs;
  var cropImageSize = ''.obs;

  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;

  TextEditingController textEditingControllerSlideIn = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

@override
  void dispose() {
    textEditingControllerSlideIn.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${((File(selectedImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";

      _cropImage();
      // // Crop
      // final cropImageFile = await ImageCropper().cropImage(
      //     sourcePath: selectedImagePath.value,
      //     maxWidth: 512,
      //     maxHeight: 512,
      //     compressFormat: ImageCompressFormat.jpg);
      // cropImagePath.value = cropImageFile!.path;
      // cropImageSize.value =
      //     "${((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";

      // //Compress
      // final dir = await Directory.systemTemp;
      // final targetPath = dir.absolute.path + "/temp.jpg";

      // var compressedFile = await FlutterImageCompress.compressAndGetFile(
      //     cropImagePath.value, targetPath,
      //     quality: 90);
      // compressImagePath.value = compressedFile!.path;
      // compressImageSize.value =
      //     "${((File(compressImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";

      // uploadImage(compressedFile);
    } else {
      showAwesomeSnackbar(
          "Error", "An Error happened when try to load the image");
    }
  }

  showAwesomeSnackbar(String title, String message) {
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.transparent,
        titleText: const Text(
          '',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        messageText: AwesomeSnackbarContent(
          message: message,
          contentType: ContentType.failure,
          title: title,
        ),
        isDismissible: true,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _cropImage() async {
    List<PlatformUiSettings> uiSetting;
    final cropImageFile = await ImageCropper().cropImage(
      sourcePath: selectedImagePath.value,
      cropStyle: CropStyle.rectangle,
      maxWidth: 512,
      maxHeight: 512,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
          toolbarColor: AppColors.bgColor,
          toolbarTitle: 'Crop Image',
          toolbarWidgetColor: AppColors.feldgrauColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: false)
      ],
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );

    cropImagePath.value = cropImageFile!.path;
    cropImageSize.value =
        "${((File(cropImagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)} MB";
  }

  List<String> getTypeList() {
    List<String> data = ['Street', 'Land', 'Farm'];
    return data;
  }

  List<String> getCitiesList() {
    List<String> data = ['Sana\'a', 'Aden', 'Hadrumot', "Alhodaida", "Hajah", "Ibb", "Taiz"];
    return data;
  }

  List<String> getTypeData() {
    // List<Types> data = [Types(typeId: 1, typeName: 'Street')];

    final items = List<Types>.generate(
      1, 
      (i) => Types(typeId: 1, typeName: 'Street'),
    );
    return items.map((e) => e.typeName).toList();
  }
}

class Types {
  final int typeId;
  final String typeName;

  Types({required this.typeId, required this.typeName});
}
