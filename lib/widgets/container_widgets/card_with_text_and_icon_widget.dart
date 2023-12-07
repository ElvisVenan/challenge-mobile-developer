import 'package:flutter/material.dart';

import '../../const/app_dimens.dart';
import '../../const/app_text_styles.dart';
import '../../const/app_colors.dart';

class CardWithTextAndIconWidget extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CardWithTextAndIconWidget({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.defaultMarginDimension),
      child: SizedBox(
        height: 110,
        child: Card(
          color: AppColors.pureWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.smallMarginDimension),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppDimens.tinyMarginDimension,
                    ),
                    Text(
                      title,
                      style: AppTextStyles.interBlackFontStyle(
                        fontSize: AppDimens.fontSizeBigDimension,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: AppDimens.smallMarginDimension),
                    Text(
                      subtitle1,
                      style: AppTextStyles.interBlackFontStyle(
                        fontSize: AppDimens.fontSizeSmallDimension,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: AppDimens.tinyMarginDimension),
                    Text(
                      subtitle2,
                      style: AppTextStyles.interBlackFontStyle(
                        fontSize: AppDimens.fontSizeSmallDimension,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: AppDimens.defaultMarginDimension),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: onEdit,
                      child: const Icon(Icons.edit_outlined),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                        onTap: onDelete,
                        child: const Icon(Icons.delete_outline_outlined)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
