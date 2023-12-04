import 'package:flutter/material.dart';

import '../../../../const/app_dimens.dart';
import '../../../../const/app_strings.dart';
import '../../../../const/app_text_styles.dart';


class ButtonWithColoredTextWidget extends StatelessWidget {
  final Function()? forgotUsername;
  final Function()? forgotPassword;

  const ButtonWithColoredTextWidget({
    super.key,
    this.forgotUsername,
    this.forgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: forgotUsername,
          child: Text(AppStrings.forgotUsernameString,
              style: AppTextStyles.oceanBlueFontStyle()),
        ),
        const SizedBox(
          width: AppDimens.tinyMarginDimension,
        ),
        Text(AppStrings.orString.toLowerCase()),
        const SizedBox(
          width: AppDimens.tinyMarginDimension,
        ),
        InkWell(
          onTap: forgotPassword,
          child: Text(
            AppStrings.forgotPasswordString,
            style: AppTextStyles.oceanBlueFontStyle(),
          ),
        ),
      ],
    );
  }
}
