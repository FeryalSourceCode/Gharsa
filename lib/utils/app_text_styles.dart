import 'package:flutter/material.dart';
import 'package:gharsah_flutter/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle heading = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.gBlack);

  static TextStyle subHeading = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark);
}

/// to handle failure, success, help and warning `ContentType` class is being used
class ContentType {
  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  ContentType(this.message, [this.color]);

  static ContentType help = ContentType('help', DefaultColors.helpBlue);
  static ContentType failure = ContentType('failure', DefaultColors.failureRed);
  static ContentType success =
      ContentType('success', DefaultColors.successGreen);
  static ContentType warning =
      ContentType('warning', DefaultColors.warningYellow);
}
