import 'package:challenge_mobile_developer/pages/login_page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../pages/splash_page/splash_page.dart';
import '../utils/const/app_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        ...servicesRemoteBinds,
        ...controllersBinds,
      ];

  List<Bind> get servicesRemoteBinds => [
        Bind.lazySingleton((i) => http.Client()),
      ];

  List<Bind> get controllersBinds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.appDefaultPage,
            child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.appSplashPage,
            child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.appLoginPage,
            child: (context, args) => const LoginPage()),
      ];
}
