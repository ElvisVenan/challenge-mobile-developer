import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/popup_message.dart';
import '../../../utils/show_message.dart';

import '../../../models/params/academic_record_params/student_params.dart';
import '../../../models/student_models/student_model.dart';
import '../../../services/remote/student_service/abstract_student_service.dart';

part 'student_registration_controller.g.dart';

class StudentRegistrationController = _StudentRegistrationController
    with _$StudentRegistrationController;

abstract class _StudentRegistrationController with Store {
  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  @observable
  StudentModel? student;

  @observable
  String studentName = "";

  @action
  void getStudentName(String getStudentName) => studentName = getStudentName;

  @observable
  String email = "";

  @action
  void getEmail(String getEmail) => email = getEmail;

  @observable
  String dateOfBirth = "";

  @action
  void getDateOfBirth(String getDateOfBirth) => dateOfBirth = getDateOfBirth;

  @observable
  String cpf = "";

  @action
  void getCpf(String getCpf) => cpf = getCpf;

  @observable
  String ra = "";

  @action
  void getRA(String getRA) => ra = getRA;

  @action
  Future<void> createStudent(BuildContext context) async {
    isLoading = true;
    final studentController = Modular.get<StudentService>();

    final students = await studentController.createStudent(
      StudentParams(
        ra: ra,
        name: studentName,
        email: email,
        dateOfBirth: dateOfBirth,
        cpf: cpf,
      ),
    );

    students.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
      isLoading = false;
    }, (success) {
      student = success;
      PopupMessage.showStudentAddedPopup(context);
      isLoading = false;
    });
  }

  @action
  Future<void> updateStudent(
      BuildContext context, StudentModel studentModel) async {
    isLoading = true;
    final studentController = Modular.get<StudentService>();

    final students = await studentController.updateStudent(studentModel);

    students.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
      isLoading = false;
    }, (success) {
      student = success;
      PopupMessage.showStudentUpdatePopup(context);
      isLoading = false;
    });
  }
}
