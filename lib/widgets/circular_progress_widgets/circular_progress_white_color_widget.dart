import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';

class CircularProgressWhiteColorWidget extends StatelessWidget {
  const CircularProgressWhiteColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppDimens.defaultMarginDimension,
      width: AppDimens.defaultMarginDimension,
      child: CircularProgressIndicator(
        color: AppColors.pureWhiteColor,
      ),
    );
  }
}
