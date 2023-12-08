import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../const/app_strings.dart';
import '../utils/show_message.dart';

import '../services/local_database/i_local_service.dart';
import '../services/local_database/local_service_impl.dart';
import '../services/remote_database/authentication_service/authentication_service.dart';
import '../models/authentication_model/authentication_model.dart';
import '../pages/home_page/home_page.dart';
import '../models/params/authentication_params/authentication_params.dart';

part 'authentication_controller.g.dart';

class AuthenticationController = _AuthenticationController
    with _$AuthenticationController;

abstract class _AuthenticationController with Store {
  @observable
  bool isLoading = false;

  @observable
  String email = "";

  @action
  void setUser(String getUser) => email = getUser;

  @observable
  String password = "";

  @observable
  AuthenticationModel? authenticationResponse;

  @observable
  List<AuthenticationModel> authenticationList = [];

  @action
  void setPassword(String getPassword) => password = getPassword;

  @observable
  String errorMessage = '';

  @action
  Future<void> authentication(BuildContext context) async {
    isLoading = true;
    final authController = Modular.get<AuthenticationService>();

    final authData = await authController
        .getUser(AuthenticationParams(email: email, password: password));

    authData.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
    }, (success) {
      authenticationList = success;
      if(authenticationList.isNotEmpty){
        saveInfoLogin();
        HomePage.navigate();
      } else{
        ShowMessage.showErrorMessage(context, AppStrings.authenticationFailureMessageString);
      }

      isLoading = false;
    });
  }

  @action
  Future<void> validateLoggedInUse(int id) async {
    isLoading = true;
    final authController = Modular.get<AuthenticationService>();

    final authData = await authController.getUserById(id);

    authData.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
    }, (success) {
      authenticationResponse = success;
      isLoading = false;
    });
  }

  @action
  Future<void> saveInfoLogin() async {
    final localServiceController = Modular.get<ILocalService>();

    await localServiceController.save(
        LocalServiceImpl.ID_KEY, authenticationList[0].id);
    await localServiceController.save(
        LocalServiceImpl.EMAIL_KEY, authenticationList[0].email);
    await localServiceController.save(
        LocalServiceImpl.TOKEN_KEY, authenticationList[0].token);
  }
}
