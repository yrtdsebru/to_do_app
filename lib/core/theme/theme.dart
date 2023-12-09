import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Theme{

  static bool get isDark => Hive.box('settings').get('isDark', defaultValue: false);
  static get bgColor => isDark ? bgDarkGreyColor : bgLightGreyColor;
  static get buttonColor => isDark ? buttonDarkEnableColor : buttonLightEnableColor;
  static get buttonDisableColor => isDark ? buttonDarkDisableColor : buttonLightDisableColor;
  static get buttonEnableColor => isDark ? buttonDarkEnableColor : buttonLightEnableColor;
  static get textColor => isDark ? textDarkColor : textLightColor;
  static get textDisableColor => isDark ? textDarkDisableColor : textLightDisableColor;
  static get textEnableColor => isDark ? textDarkEnableColor : textLightEnableColor;
  static get iconColor => isDark ? iconDarkColor : iconLightColor;
  static get iconDisableColor => isDark ? iconDarkDisableColor : iconLightDisableColor;
  static get iconEnableColor => isDark ? iconDarkEnableColor : iconLightEnableColor;

  //background color
  static const bgLightGreyColor = Color.fromARGB(255, 252, 251, 251);
  static const bgDarkGreyColor = Color.fromARGB(255, 53, 53, 53);

  //button color
  static const buttonLightEnableColor = Color.fromARGB(255, 201, 80, 19);
  static const buttonLightDisableColor = Color.fromARGB(255, 237, 237, 237);
  static const buttonDarkEnableColor = Color.fromARGB(255, 145, 62, 20);
  static const buttonDarkDisableColor = Color.fromARGB(255, 109, 108, 108);

  //text color
  static const textLightEnableColor = Color.fromARGB(255, 201, 80, 19);
  static const textLightDisableColor = Color.fromARGB(255, 151, 150, 150);
  static const textDarkEnableColor = Color.fromARGB(255, 144, 58, 15);
  static const textDarkDisableColor = Color.fromARGB(255, 109, 108, 108);
  static const textDarkColor = Colors.white;
  static const textLightColor = Colors.black;

  //icon color
  static const iconLightEnableColor = Color.fromARGB(255, 255, 255, 255);
  static const iconLightDisableColor = Color.fromARGB(255, 128, 128, 128);
  static const iconDarkEnableColor = Color.fromARGB(255, 255, 255, 255);
  static const iconDarkDisableColor = Color.fromARGB(255, 60, 58, 58);
  static const iconDarkColor = Color.fromARGB(255, 39, 38, 38);
  static const iconLightColor = Colors.white;
}