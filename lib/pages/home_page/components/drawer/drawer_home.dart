import 'package:flutter/material.dart';

import '../../../../const/app_text_styles.dart';
import '../../../../const/app_colors.dart';

class DrawerHome extends StatelessWidget {
  final Function()? menuOnTap;
  final Function()? studentOnTap;

  const DrawerHome({
    Key? key,
    required this.menuOnTap,
    required this.studentOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.oceanBlueColor,
            ),
            child: Text(
              'Menu Lateral',
              style: AppTextStyles.interWhiteFontStyle(
                  fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: menuOnTap,
          ),
          ListTile(
            title: const Text('Adicionar Alunos'),
            onTap: studentOnTap,
          ),
        ],
      ),
    );
  }
}
