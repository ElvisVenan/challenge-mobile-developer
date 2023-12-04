import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_dimens.dart';

class AppTextStyles {

  static TextStyle? oceanBlueFontStyle({
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.inter(
      color: AppColors.oceanBlueColor,
      fontSize: AppDimens.fontSizeSmallDimension,
      fontWeight: fontWeight,
    );
  }

  static TextStyle interBlackFontStyle({
    required double fontSize,
    required FontWeight fontWeight,
    TextDecoration? textDecoration,
  }) {
    return GoogleFonts.inter(
      color: AppColors.pureBlackColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration,
    );
  }

}
