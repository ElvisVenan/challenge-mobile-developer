import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'const/app_routes.dart';

import '../controller/authentication_controller.dart';
import '../pages/login_page/login_page.dart';
import '../services/authentication_service/authentication_service.dart';
import '../services/authentication_service/authentication_service_Implementation.dart';
import '../pages/splash_page/splash_page.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [
        ...servicesRemoteBinds,
        ...controllersBinds,
      ];

  List<Bind> get servicesRemoteBinds => [
        Bind.lazySingleton((i) => http.Client()),
        Bind.lazySingleton<AuthenticationService>(
            (i) => AuthenticationServiceImpl(i())),
      ];

  List<Bind> get controllersBinds => [
    Bind.factory((i) => AuthenticationController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.appDefaultPage,
            child: (context, args) => const LoginPage()),
        ChildRoute(AppRoutes.appSplashPage,
            child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.appLoginPage,
            child: (context, args) => const LoginPage()),
      ];
}
