import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';
import '../../const/app_drawables.dart';

import '../../pages/splash_page/splash_controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Modular.get<SplashController>();
    splashController.checkLoggedInUser();
    return Scaffold(
      backgroundColor: AppColors.pureWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: AppDimens.immenseMarginDimension,
              width: AppDimens.immenseMarginDimension,
              child: Image.asset(AppDrawables.logoIcon),
            ),
          ),
        ],
      ),
    );
  }
}
