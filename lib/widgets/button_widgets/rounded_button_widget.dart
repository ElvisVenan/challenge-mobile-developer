import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color? textColor;
  final bool border;

  const RoundedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    this.textColor,
    this.border = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.largeMarginDimension,
      width: double.infinity,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(AppDimens.bigMarginDimension),
        border: Border.all(color: border ? Colors.transparent : AppColors.softSkyBlueColor),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}