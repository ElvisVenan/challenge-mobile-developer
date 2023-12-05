import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'const/app_routes.dart';

import '../pages/home_page/home_page.dart';
import '../services/local_database/i_local_service.dart';
import '../services/local_database/local_service_impl.dart';
import '../services/remote_database/authentication_service/authentication_service.dart';
import '../services/remote_database/authentication_service/authentication_service_Implementation.dart';
import '../controller/authentication_controller.dart';
import '../pages/login_page/login_page.dart';
import '../pages/splash_page/splash_page.dart';
import 'controller/home_controller.dart';
import 'controller/splash_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        ...servicesRemoteBinds,
        ...servicesLocalBinds,
        ...controllersBinds,
      ];

  List<Bind> get servicesRemoteBinds => [
        Bind.lazySingleton((i) => http.Client()),
        Bind.lazySingleton<AuthenticationService>(
            (i) => AuthenticationServiceImpl(i())),
      ];

  List<Bind> get servicesLocalBinds => [
        Bind.lazySingleton<ILocalService>((i) => LocalServiceImpl()),
      ];

  List<Bind> get controllersBinds => [
        Bind.factory((i) => AuthenticationController()),
        Bind.factory((i) => SplashController()),
        Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.appDefaultPage,
            child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.appSplashPage,
            child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.appLoginPage,
            child: (context, args) => const LoginPage()),
        ChildRoute(AppRoutes.appHomePage,
            child: (context, args) => const HomePage()),
      ];
}
