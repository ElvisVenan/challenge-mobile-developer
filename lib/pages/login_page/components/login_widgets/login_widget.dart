import 'package:flutter/material.dart';

import '../../../../const/app_text_styles.dart';
import '../../../../const/app_colors.dart';
import '../../../../const/app_dimens.dart';
import '../../../../const/app_drawables.dart';
import '../../../../const/app_strings.dart';

import '../../../../widgets/button_widgets/rounded_button_widget.dart';
import '../../../../widgets/text_field_widgets/rectangular_text_field_widget.dart';

import 'button_with_colored_text_widget.dart';

class LoginWidget extends StatelessWidget {
  final Function(String)? getUser;
  final Function(String)? getPassword;
  final Function()? forgotUsername;
  final Function()? forgotPassword;
  final Function() login;
  final Function() register;
  final Widget loading;

  const LoginWidget({
    super.key,
    this.getUser,
    this.getPassword,
    this.forgotUsername,
    this.forgotPassword,
    required this.login,
    required this.register,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimens.bigMarginDimension),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimens.immenseMarginDimension,
                    width: AppDimens.immenseMarginDimension,
                    child: Image.asset(AppDrawables.logoIcon),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  Column(
                    children: [
                      RectangularTextFieldWidget(
                        prefixIcon: const Icon(Icons.person_outline),
                        label: AppStrings.usernameString,
                        onChanged: getUser,
                      ),
                      const SizedBox(
                        height: AppDimens.defaultMarginDimension,
                      ),
                      RectangularTextFieldWidget(
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: const Icon(Icons.visibility_outlined),
                        label: AppStrings.passwordString,
                        onChanged: getPassword,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppDimens.smallMarginDimension,
                  ),
                  ButtonWithColoredTextWidget(
                    forgotUsername: forgotUsername,
                    forgotPassword: forgotPassword,
                  ),
                  const SizedBox(
                    height: AppDimens.largeMarginDimension,
                  ),
                  RoundedButtonWidget(
                    text: loading,
                    textColor: AppColors.pureWhiteColor,
                    onPressed: login,
                    buttonColor: AppColors.oceanBlueColor,
                  ),
                  const SizedBox(
                    height: AppDimens.smallMarginDimension,
                  ),
                  RoundedButtonWidget(
                    text: Text(
                      AppStrings.registerString,
                      style: AppTextStyles.interBlackFontStyle(
                          fontSize: AppDimens.fontSizeSmallDimension,
                          fontWeight: FontWeight.w500),
                    ),
                    textColor: AppColors.oceanBlueColor,
                    onPressed: register,
                    buttonColor: AppColors.pureWhiteColor,
                    border: false,
                  ),
                  const SizedBox(
                    height: AppDimens.ampleMarginDimension,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
