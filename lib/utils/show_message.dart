import 'package:flutter/material.dart';

import '../const/app_colors.dart';

class ShowMessage{

  static void showErrorMessage(BuildContext context, String error) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.softSkyBlueColor,
      content: Text(error),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSuccessMessage(BuildContext context, String success) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.softSkyBlueColor,
      content: Text(success),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}