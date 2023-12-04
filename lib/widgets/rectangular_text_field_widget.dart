import 'package:flutter/material.dart';

import 'package:challenge_mobile_developer/const/app_text_styles.dart';
import '../const/app_colors.dart';

class RectangularTextFieldWidget extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const RectangularTextFieldWidget({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (prefixIcon != null) prefixIcon!,
        Expanded(
          child: TextFormField(
            onChanged: (String text) {},
            style: AppTextStyles.interBlackFontStyle(
                fontSize: 12, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: 12, fontWeight: FontWeight.w400),
              labelStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: 12, fontWeight: FontWeight.w400),
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.oceanBlueColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        if (suffixIcon != null) suffixIcon!,
      ],
    );
  }
}
