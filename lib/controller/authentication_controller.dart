import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../utils/show_message.dart';

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

  @action
  void setPassword(String getPassword) => password = getPassword;

  @observable
  String errorMessage = '';

  @action
  Future<void> authenticate(BuildContext context) async {
    isLoading = true;
    final authController = Modular.get<AuthenticationService>();

    final authData = await authController
        .authentication(AuthenticationParams(email: email, password: password));

    authData.fold((error) {
      errorMessage = error.friendlyMessage;
      isLoading = false;
      if (errorMessage.isNotEmpty) {
        ShowMessage.showErrorMessage(context, errorMessage);
      }
    }, (success) {
      isLoading = false;
    });
  }
}
