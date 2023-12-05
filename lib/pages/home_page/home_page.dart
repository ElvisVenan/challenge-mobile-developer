import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routePath = AppRoutes.appHomePage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push(String args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(""),
    );
  }
}
