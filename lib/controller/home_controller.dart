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
  List<StudentModel> studentModel = ObservableList();

  @observable
  StudentModel? student;

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

  @action
  Future<void> deleteStudent(BuildContext context, int id) async {
    isLoading = true;
    final studentController = Modular.get<StudentService>();

    final students = await studentController.deleteStudent(id);

    students.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
      isLoading = false;
    }, (success) {
      student = success;
      isLoading = false;
    });
  }

  @action
  Future<void> getStudentById(BuildContext context, int id) async {
    isLoading = true;
    final studentController = Modular.get<StudentService>();

    final students = await studentController.getStudentById(id);

    students.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
    }, (success) {
      student = success;
      isLoading = false;
    });
  }

  @action
  void searchInfoByName(String searchText, BuildContext context) {
    if (searchText.isEmpty) {
      studentModel.clear();
      getStudents(context);
    }
    studentModel = ObservableList.of(
      studentModel.where(
            (item) => item.name.toLowerCase().contains(searchText.toLowerCase()),
      ),
    );
  }

}
