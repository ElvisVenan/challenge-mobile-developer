import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../utils/show_message.dart';

import '../models/authentication_model/authentication_model.dart';
import '../pages/home_page/home_page.dart';
import '../services/local_service/i_local_service.dart';
import '../services/local_service/local_service_impl.dart';
import '../models/params/authentication_params/authentication_params.dart';
import '../services/authentication_service/authentication_service.dart';

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

  @action
  void setPassword(String getPassword) => password = getPassword;

  @observable
  String errorMessage = '';

  @action
  Future<void> createUser(BuildContext context) async {
    isLoading = true;
    final authController = Modular.get<AuthenticationService>();

    final authData = await authController
        .createUser(AuthenticationParams(email: email, password: password));

    authData.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
    }, (success) {
      authenticationResponse = success;
      saveInfoLogin();
      HomePage.navigate();
      isLoading = false;
    });
  }

  @action
  Future<void> login(int id) async {
    isLoading = true;
    final authController = Modular.get<AuthenticationService>();

    final authData = await authController.getUser(id);

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
        LocalServiceImpl.ID_KEY, authenticationResponse!.id);
    await localServiceController.save(
        LocalServiceImpl.EMAIL_KEY, authenticationResponse!.email);
    await localServiceController.save(
        LocalServiceImpl.TOKEN_KEY, authenticationResponse!.token);
  }
}
