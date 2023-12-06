import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';
import '../../const/app_strings.dart';
import '../../const/app_routes.dart';
import '../../const/app_text_styles.dart';

import '../../utils/text_field_validator.dart';

import '../../pages/home_page/home_page.dart';
import '../../widgets/circular_progress_widgets/circular_progress_white_color_widget.dart';
import '../../widgets/app_bar_widgets/app_bar_ocean_blue_color_widget.dart';
import '../../widgets/button_widgets/rounded_button_widget.dart';
import '../../widgets/text_field_widgets/rectangular_text_field_widget.dart';
import '../../../controller/student_registration_controller.dart';

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({super.key});

  static const String routePath = AppRoutes.appStudentRegistrationPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push() => Modular.to.pushNamed(routePath);

  @override
  State<StudentRegistrationPage> createState() =>
      _StudentRegistrationPageState();
}

class _StudentRegistrationPageState extends State<StudentRegistrationPage> {
  final controller = Modular.get<StudentRegistrationController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const textBoxSpacing = AppDimens.bigMarginDimension;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarOceanBlueColorWidget(
        title: AppStrings.addStudentString,
        showIconArrow: true,
        returnPage: () => {HomePage.push("args")},
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.defaultMarginDimension),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.generalDataString,
                  style: AppTextStyles.interBlackFontStyle(
                    fontSize: AppDimens.defaultMarginDimension,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  label: "${AppStrings.studentNameString}*",
                  onChanged: (text) => controller.getStudentName(text),
                  validator: (value) =>
                      TextFieldValidator.validateRequired(value),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  label: AppStrings.birthdateString,
                  onChanged: (text) => controller.getDateOfBirth(text),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  label: "${AppStrings.cpfString}*",
                  onChanged: (text) => controller.getCpf(text),
                  validator: (value) =>
                      TextFieldValidator.validateRequired(value),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  label: "${AppStrings.academicRecordString}*",
                  onChanged: (text) => controller.getRA(text),
                  validator: (value) =>
                      TextFieldValidator.validateRequired(value),
                ),
                const SizedBox(
                  height: textBoxSpacing,
                ),
                Text(
                  AppStrings.accessCredentialsString,
                  style: AppTextStyles.interBlackFontStyle(
                    fontSize: AppDimens.defaultMarginDimension,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: textBoxSpacing,
                ),
                RectangularTextFieldWidget(
                  label: "${AppStrings.emailString}*",
                  onChanged: (text) => controller.getEmail(text),
                  validator: (value) =>
                      TextFieldValidator.validateRequired(value),
                ),
                const SizedBox(height: textBoxSpacing),
                Observer(
                  builder: (context) {
                    return RoundedButtonWidget(
                      text: !controller.isLoading ? Text(
                        AppStrings.addString,
                        style: AppTextStyles.interWhiteFontStyle(
                          fontSize: AppDimens.defaultMarginDimension,
                          fontWeight: FontWeight.w500,
                        ),
                      ) : const CircularProgressWhiteColorWidget(),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.createStudent(context);
                          if (controller.errorMessage.isEmpty) {}
                        }
                      },
                      buttonColor: AppColors.oceanBlueColor,
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


