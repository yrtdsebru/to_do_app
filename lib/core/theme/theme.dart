import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/constants/app_colors.dart';

class Themes{
  static bool get isDark => Hive.box('settings').get('isDark', defaultValue: false);
  static get bgColor => isDark ? AppColors.darkGrey : AppColors.white;
  static get bgTextColor => isDark ? AppColors.black87 : AppColors.white70;
  static get splashColor => isDark ? AppColors.darkOrange : AppColors.lightOrange;
  static get buttonColor => isDark ? AppColors.darkOrange : AppColors.lightOrange;
  static get buttonDisableColor => isDark ? AppColors.white30 : AppColors.white70;
  static get buttonEnableColor => isDark ? AppColors.darkOrange : AppColors.lightOrange;
  static get textColor => isDark ? AppColors.white : AppColors.black;
  static get textDisableColor => isDark ? AppColors.white30 : AppColors.white70;
  static get textEnableColor => isDark ? AppColors.darkOrange : AppColors.lightOrange;
  static get iconColor => isDark ? AppColors.black : AppColors.white;
}