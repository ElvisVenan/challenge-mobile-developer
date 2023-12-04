import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_routes.dart';
import 'components/login_widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routePath = AppRoutes.appLoginPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push(String args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhiteColor,
      body: LoginWidget(
        getUser: (String? text) {},
        getPassword: (String? text) {},
        forgotUsername: () {},
        forgotPassword: () {},
        login: () {},
        register: () {},
      ),
    );
  }
}
