import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../const/app_colors.dart';
import '../../const/app_strings.dart';
import '../../const/app_routes.dart';

import '../../utils/popup_message.dart';
import '../../controller/home_controller.dart';
import '../../widgets/floating_action_button_widgets/floating_button_with_icon_and_text_widget.dart';
import '../../pages/student_registration_page/student_registration_page.dart';
import '../../widgets/app_bar_widgets/app_bar_ocean_blue_color_widget.dart';
import './../../pages/home_page/components/bottom_navigation_pages/helper_page.dart';
import './../../pages/home_page/components/bottom_navigation_pages/menu_page.dart';
import './../../pages/home_page/components/bottom_navigation_pages/notification_page.dart';
import './../../pages/home_page/components/bottom_navigation_pages/profile_page.dart';

import 'components/drawer/drawer_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routePath = AppRoutes.appHomePage;

  static void navigate() => Modular.to.navigate(routePath);

  static void push() => Modular.to.pushNamed(routePath);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeController>();
    controller.getStudents(context);
    return Scaffold(
        appBar: const AppBarOceanBlueColorWidget(
          title: AppStrings.studentString,
          showIconArrow: false,
        ),
        body: Observer(
          builder: (_) {
            return IndexedStack(
              index: controller.currentIndex,
              children: [
                !controller.isLoading
                    ? MenuPage(
                        student: controller.studentModel,
                        onEdit: (int studentId) async {
                          await controller.getStudentById(context, studentId);
                          StudentRegistrationPage.push(controller.student);
                        },
                        onDelete: (int studentId) {
                          PopupMessage.showStudentDeletedPopup(
                              context: context,
                              onConfirm: () async {
                                await controller.deleteStudent(
                                    context, studentId);
                                controller.getStudents(context);
                                Navigator.of(context).pop();
                              });
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
                const HelperPage(),
                const NotificationPage(),
                const ProfilePage(),
              ],
            );
          },
        ),
        floatingActionButton: FloatingButtonWithIconAndTextWidget(
          icon: Icons.add,
          onPressed: () => StudentRegistrationPage.push(null),
          text: AppStrings.addStudentString,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        bottomNavigationBar: Observer(
          builder: (context) {
            return BottomNavigationBar(
              selectedItemColor: AppColors.oceanBlueColor,
              unselectedItemColor: AppColors.grayColor,
              currentIndex: controller.currentIndex,
              onTap: (index) {
                controller.changeTabIndex(index);
                if (index == 0) {
                  Scaffold.of(context).openDrawer();
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: AppStrings.menuString,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help_outline),
                  label: AppStrings.helperString,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_outlined),
                  label: AppStrings.notificationString,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_outlined),
                  label: AppStrings.profileString,
                ),
              ],
            );
          },
        ),
        drawer: DrawerHome(
          menuOnTap: () {
            controller.changeTabIndex(0);
            Navigator.pop(context);
          },
          studentOnTap: () {
            StudentRegistrationPage.navigate();
          },
        ));
  }
}
