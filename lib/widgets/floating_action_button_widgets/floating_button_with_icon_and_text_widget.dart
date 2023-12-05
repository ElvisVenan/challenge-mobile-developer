import 'package:flutter/material.dart';

import '../../../../const/app_colors.dart';
import '../../../../const/app_dimens.dart';
import '../../../../const/app_text_styles.dart';

class FloatingButtonWithIconAndTextWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final IconData? icon;

  const FloatingButtonWithIconAndTextWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: AppColors.oceanBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.defaultMarginDimension),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Icon(
              icon,
              color: Colors.white,
              size: AppDimens.defaultMarginDimension,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: AppTextStyles.interWhiteFontStyle(
                  fontSize: AppDimens.fontSizeMiniDimension,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
