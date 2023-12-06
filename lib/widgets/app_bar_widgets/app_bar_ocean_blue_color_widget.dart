import 'package:flutter/material.dart';

import '../../const/app_text_styles.dart';
import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';

class AppBarOceanBlueColorWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final bool showIconArrow;
  final Function()? returnPage;

  const AppBarOceanBlueColorWidget({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = false,
    this.returnPage,
    this.showIconArrow = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.pureWhiteColor,
        ),
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(
          title,
          style: AppTextStyles.interWhiteFontStyle(
            fontSize: AppDimens.bigMarginDimension,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.oceanBlueColor,
        leading: showIconArrow ? IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: returnPage,
        ) : null);
  }
}
