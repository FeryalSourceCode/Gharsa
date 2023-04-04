// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gharsah_flutter/utils/hex_converter.dart';

class AppColors {
  static Color container = const Color.fromARGB(255, 37, 76, 95);
  static Color gBlack = Colors.black;
  static Color gWhite = Colors.white;
  static Color gGray = Colors.grey;
  static Color textDark = Colors.white38;

  // static Color bgColor = const Color(0xFFf8faf8);
   static Color bgColor = HexColor.fromHex('#f8faf8');
  

  static Color middleGreenColor = HexColor.fromHex('#4E944F');
  static Color dollarGreenColor = HexColor.fromHex('#83BD75');
  static Color grannyAppleColor = HexColor.fromHex('#B4E197');
  static Color paleSpringBudColor = HexColor.fromHex('#E9EFC0');

  static Color EggshellColor = HexColor.fromHex('#EDF1D6');
  static Color rifleGreenColor = HexColor.fromHex('#40513B');
  static Color lightYellowColor = HexColor.fromHex('#FEFFDE');
  static Color feldgrauColor = HexColor.fromHex('#3C6255');
  static Color mediumJungleGreen =  HexColor.fromHex('#1E312B');

  static Color jetStreamColor = HexColor.fromHex('#BBCBC2');
  static Color culturedGray = HexColor.fromHex('#f7f7f7');
  static Color platinum = HexColor.fromHex('#E8E8E8');
  
  static Color bronzeColor = HexColor.fromHex('#AA8B56');
  static Color mustardYellowColor = HexColor.fromHex('#E7B10A');
  static Color mediumChampagneColor = HexColor.fromHex('#FFE9A0');
  static Color blondColor = HexColor.fromHex('#F5F0BB');
  static Color beigeColor = HexColor.fromHex('#F7F6DC');
}

/// `DefaultColors` incase `color` paramter is null in `ContentType`
class DefaultColors {
  /// help
  static const Color helpBlue = Color(0xff3282B8);

  /// failure
  static const Color failureRed = Color(0xffc72c41);

  /// success
  static const Color successGreen = Color(0xff2D6A4F);

  /// warning
  static const Color warningYellow = Color(0xffFCA652);
}
