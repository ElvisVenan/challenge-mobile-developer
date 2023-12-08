import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_dimens.dart';
import '../../const/app_strings.dart';
import '../../const/app_routes.dart';
import '../../const/app_text_styles.dart';

import '../../utils/text_field_validator.dart';
import '../../utils/text_input_formatter_mask.dart';

import '../../pages/student_registration_page/student_registration_controller/student_registration_controller.dart';
import '../../pages/home_page/home_page.dart';
import '../../models/student_models/student_model.dart';
import '../../widgets/circular_progress_widgets/circular_progress_white_color_widget.dart';
import '../../widgets/app_bar_widgets/app_bar_ocean_blue_color_widget.dart';
import '../../widgets/button_widgets/rounded_button_widget.dart';
import '../../widgets/text_field_widgets/rectangular_text_field_widget.dart';

class StudentRegistrationPage extends StatefulWidget {
  const StudentRegistrationPage({super.key});

  static const String routePath = AppRoutes.appStudentRegistrationPage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push(StudentModel? args) =>
      Modular.to.pushNamed(routePath, arguments: args);

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
    final args = ModalRoute.of(context)?.settings.arguments as StudentModel?;
    controller.studentName = args?.name ?? "";
    controller.dateOfBirth = args?.birthdate ?? "";
    controller.cpf = args?.cpf ?? "";
    controller.ra = args?.academicRecord ?? "";
    controller.email = args?.email ?? "";

    return Scaffold(
      appBar: AppBarOceanBlueColorWidget(
        title: AppStrings.addStudentString,
        showIconArrow: true,
        returnPage: () => {HomePage.push()},
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
                  keyboardType: TextInputType.name,
                  textController: controller.studentName,
                  label: "${AppStrings.studentNameString}*",
                  onChanged: (text) => controller.getStudentName(text),
                  validator: (value) =>
                      TextFieldValidator.validateRequired(value),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  keyboardType: TextInputType.number,
                  textController: controller.dateOfBirth,
                  label: AppStrings.birthdateString,
                  onChanged: (text) => controller.getDateOfBirth(text),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  inputFormatters: [
                    TextInputFormatterMask(
                      numberOfCharactersDefinedForInputText: '###.###.###-##',
                      firstNumberSeparatorDefined: '.',
                      secondNumberSeparatorDefined: '-',
                    )
                  ],
                  enabled: args?.id != null ? false : true,
                  keyboardType: TextInputType.number,
                  textController: controller.cpf,
                  label: "${AppStrings.cpfString}*",
                  onChanged: (text) => controller.getCpf(text),
                  validator: (value) => TextFieldValidator.validateCPF(value),
                ),
                const SizedBox(height: textBoxSpacing),
                RectangularTextFieldWidget(
                  enabled: args?.id != null ? false : true,
                  keyboardType: TextInputType.number,
                  textController: controller.ra,
                  onChanged: (text) => controller.getRA(text),
                  label: "${AppStrings.academicRecordString}*",
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
                  keyboardType: TextInputType.emailAddress,
                  textController: controller.email,
                  label: "${AppStrings.emailString}*",
                  onChanged: (text) => controller.getEmail(text),
                  validator: (value) => TextFieldValidator.validateEmail(value),
                ),
                const SizedBox(height: textBoxSpacing),
                Observer(builder: (context) {
                  return RoundedButtonWidget(
                    text: !controller.isLoading
                        ? Text(
                            AppStrings.addString,
                            style: AppTextStyles.interWhiteFontStyle(
                              fontSize: AppDimens.defaultMarginDimension,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const CircularProgressWhiteColorWidget(),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (args?.id != null) {
                          await controller.updateStudent(
                              context,
                              StudentModel(
                                id: args!.id,
                                name: controller.studentName,
                                email: controller.email,
                                birthdate: controller.dateOfBirth,
                                cpf: controller.cpf,
                                createdAt: "",
                                academicRecord: controller.ra,
                              ));
                        } else {
                          await controller.createStudent(context);
                        }
                      }
                    },
                    buttonColor: AppColors.oceanBlueColor,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
