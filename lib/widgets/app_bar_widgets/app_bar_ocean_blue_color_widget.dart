import 'package:flutter/material.dart';

import '../../const/app_text_styles.dart';
import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';

class AppBarOceanBlueColorWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const AppBarOceanBlueColorWidget({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style:  AppTextStyles.interWhiteFontStyle(
          fontSize: AppDimens.bigMarginDimension,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: AppColors.oceanBlueColor,
    );
  }
}
