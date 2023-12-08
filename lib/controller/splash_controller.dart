import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../pages/login_page/login_page.dart';
import '../services/local/abstract_local_service.dart';
import '../services/local/local_service_impl.dart';
import '../pages/home_page/authentication_controller/authentication_controller.dart';
import '../pages/home_page/home_page.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashController with _$SplashController;

abstract class _SplashController with Store {
  @action
  Future<void> checkLoggedInUser() async {
    final localServiceController = Modular.get<ILocalService>();

    final authController = Modular.get<AuthenticationController>();
    var id = await localServiceController.get(LocalServiceImpl.ID_KEY);

    if (id != null) {
      await authController.validateLoggedInUse(int.parse(id));
      if (id == (authController.authenticationResponse?.id ?? "")) {
        HomePage.navigate();
      } else {
        LoginPage.navigate();
      }
    } else {
      LoginPage.navigate();
    }
  }
}
