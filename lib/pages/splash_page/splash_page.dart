import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/const/app_dimens.dart';
import '../../utils/const/app_drawables.dart';
import '../../utils/const/app_colors.dart';

import '../login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => LoginPage.navigate());
  }

  @override
  Widget build(BuildContext context) {
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
