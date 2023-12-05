import 'package:flutter/material.dart';

import '../const/app_text_styles.dart';
import '../const/app_colors.dart';
import '../const/app_dimens.dart';

class RectangularTextFieldWidget extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;

  const RectangularTextFieldWidget({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefixIcon != null) prefixIcon!,
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            style: AppTextStyles.interBlackFontStyle(
                fontSize: AppDimens.fontSizeMiniDimension, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: AppDimens.fontSizeMiniDimension, fontWeight: FontWeight.w400),
              labelStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: AppDimens.fontSizeMiniDimension, fontWeight: FontWeight.w400),
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.oceanBlueColor),
                borderRadius: BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
            ),
          ),
        ),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
