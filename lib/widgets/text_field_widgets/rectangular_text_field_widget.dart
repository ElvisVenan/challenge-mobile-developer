import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/app_text_styles.dart';
import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';

class RectangularTextFieldWidget extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String? textController;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const RectangularTextFieldWidget({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
    this.validator,
    this.textController,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            controller: TextEditingController(text: textController),
            obscureText: obscureText,
            onChanged: onChanged,
            validator: validator,
            style: AppTextStyles.interBlackFontStyle(
                fontSize: AppDimens.fontSizeMiniDimension,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: AppDimens.fontSizeMiniDimension,
                  fontWeight: FontWeight.w400),
              labelStyle: AppTextStyles.interBlackFontStyle(
                  fontSize: AppDimens.fontSizeMiniDimension,
                  fontWeight: FontWeight.w400),
              labelText: label,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.oceanBlueColor),
                borderRadius:
                    BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grayColor),
                borderRadius:
                    BorderRadius.circular(AppDimens.smallMarginDimension),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
