import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourLineTextFieldController extends GetxController {
  final TextEditingController textEditingController  = TextEditingController();
  final isEnabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(_checkLineCount);
  }

  @override
  void onClose() {
    textEditingController.removeListener(_checkLineCount);
    textEditingController.dispose();
    super.onClose();
  }

 void _checkLineCount() {
    final lines = textEditingController.value.text.split('\n');
    final totalLines = lines.length;
    final maxLengthPerLine = 20;

    if (totalLines >= 4 &&
        (lines[3].length == maxLengthPerLine || totalLines > 4)) {
      isEnabled.value = false;
      final newText = lines.take(4).join('\n') + '\n';
      final newSelection = TextSelection.collapsed(offset: newText.length);
      textEditingController.value = TextEditingValue(
        text: newText,
        selection: newSelection,
      );
    } else {
      isEnabled.value = true;
    }
  }
}
