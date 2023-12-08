import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_routes.dart';
import '../../const/app_strings.dart';

import '../../utils/show_message.dart';
import '../../utils/text_field_validator.dart';

import '../../controller/authentication_controller.dart';
import '../../widgets/circular_progress_widgets/circular_progress_white_color_widget.dart';
import 'components/login_widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routePath = AppRoutes.appLoginPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push(String args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AuthenticationController>();
    return Scaffold(
      backgroundColor: AppColors.pureWhiteColor,
      body: Form(
        key: _formKey,
        child: LoginWidget(
          getUser: (String? text) => controller.setUser(text!),
          getPassword: (String? text) => controller.setPassword(text!),
          forgotUsername: () => ShowMessage.showSuccessMessage(
              context, AppStrings.forgotUsernameString),
          forgotPassword: () => ShowMessage.showSuccessMessage(
              context, AppStrings.forgotPasswordString),
          validatorEmail: (value) => TextFieldValidator.validateEmail(value),
          validatorPassword: (value) => TextFieldValidator.validatePassword(value),
          login: () {
            if (_formKey.currentState!.validate()) {
              controller.authentication(context);
            }
          },
          register: () => ShowMessage.showSuccessMessage(
              context, AppStrings.registerString),
          loading: Observer(builder: (context) {
            return controller.isLoading
                ? const CircularProgressWhiteColorWidget()
                : const Text(
                    AppStrings.loginString,
                    style: TextStyle(color: AppColors.pureWhiteColor),
                  );
          }),
        ),
      ),
    );
  }
}
