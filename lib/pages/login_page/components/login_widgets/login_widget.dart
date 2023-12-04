import 'package:flutter/material.dart';

import '../../../../const/app_colors.dart';
import '../../../../const/app_dimens.dart';
import '../../../../const/app_drawables.dart';
import '../../../../const/app_strings.dart';
import '../../../../widgets/button_widgets/rounded_button_widget.dart';
import '../../../../widgets/rectangular_text_field_widget.dart';
import 'button_with_colored_text_widget.dart';

class LoginWidget extends StatelessWidget {
  final Function(String)? getUser;
  final Function(String)? getPassword;
  final Function()? forgotUsername;
  final Function()? forgotPassword;
  final Function() login;
  final Function() register;

  const LoginWidget({
    super.key,
    this.getUser,
    this.getPassword,
    this.forgotUsername,
    this.forgotPassword,
    required this.login,
    required this.register,
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
                  const Column(
                    children: [
                      RectangularTextFieldWidget(
                        label: AppStrings.usernameString,
                      ),
                      SizedBox(
                        height: AppDimens.defaultMarginDimension,
                      ),
                      RectangularTextFieldWidget(
                        label: AppStrings.passwordString,
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
                    text: AppStrings.loginString,
                    textColor: AppColors.pureWhiteColor,
                    onPressed: login,
                    buttonColor: AppColors.oceanBlueColor,
                  ),
                  const SizedBox(
                    height: AppDimens.smallMarginDimension,
                  ),
                  RoundedButtonWidget(
                    text: AppStrings.registerString,
                    textColor: AppColors.oceanBlueColor,
                    onPressed: register,
                    buttonColor: AppColors.pureWhiteColor,
                    border: false,
                  ),
                  const SizedBox(
                    height: 50,
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
