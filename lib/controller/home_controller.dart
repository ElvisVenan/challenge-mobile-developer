import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../utils/show_message.dart';

import '../models/student_models/student_model.dart';
import '../services/remote_database/academic_record_service/student_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  int currentIndex = 0;

  @observable
  List<StudentModel> studentModel = [];

  @action
  void changeTabIndex(int index) {
    currentIndex = index;
  }

  @observable
  String errorMessage = '';

  @action
  Future<void> getStudents(BuildContext context) async {
    isLoading = true;
    final studentController = Modular.get<StudentService>();

    final students = await studentController.getStudents();

    students.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
      isLoading = false;
    }, (success) {
      studentModel = success;
      isLoading = false;
    });
  }
}
