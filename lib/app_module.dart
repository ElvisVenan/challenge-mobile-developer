import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'const/app_routes.dart';

import '../pages/student_registration_page/student_registration_page.dart';
import '../pages/home_page/home_controller/home_controller.dart';
import '../pages/splash_page/splash_controller/splash_controller.dart';
import '../pages/student_registration_page/student_registration_controller/student_registration_controller.dart';
import '../pages/home_page/home_page.dart';
import '../services/local/abstract_local_service.dart';
import '../services/local/local_service_impl.dart';
import '../services/remote/student_service/abstract_student_service.dart';
import '../services/remote/student_service/student_service_impl.dart';
import '../services/remote/authentication_service/abstract_authentication_service.dart';
import '../services/remote/authentication_service/authentication_service_Impl.dart';
import '../pages/home_page/authentication_controller/authentication_controller.dart';
import '../pages/login_page/login_page.dart';
import '../pages/splash_page/splash_page.dart';


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
        Bind.lazySingleton<StudentService>((i) => StudentServiceImpl(i())),
      ];

  List<Bind> get servicesLocalBinds => [
        Bind.lazySingleton<ILocalService>((i) => LocalServiceImpl()),
      ];

  List<Bind> get controllersBinds => [
        Bind.factory((i) => AuthenticationController()),
        Bind.factory((i) => SplashController()),
        Bind.factory((i) => HomeController()),
        Bind.factory((i) => StudentRegistrationController()),
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
        ChildRoute(AppRoutes.appStudentRegistrationPage,
            child: (context, args) => const StudentRegistrationPage()),
      ];
}
