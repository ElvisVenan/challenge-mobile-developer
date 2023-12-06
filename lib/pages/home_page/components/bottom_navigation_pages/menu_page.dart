import 'package:flutter/material.dart';

import '../../../../const/app_strings.dart';

import '../../../../models/student_models/student_model.dart';
import '../../../../widgets/container_widgets/card_with_text_and_icon_widget.dart';

class MenuPage extends StatelessWidget {
  final List<StudentModel> student;
  final Function() onEdit;
  final Function(int studentId) onDelete;

  const MenuPage(
      {super.key,
      required this.student,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: student.length,
              itemBuilder: (context, i) {
                return CardWithTextAndIconWidget(
                  title: student[i].name,
                  subtitle1: student[i].academicRecord,
                  subtitle2: "${AppStrings.cpfString}: ${student[i].cpf}",
                  onEdit: onEdit,
                  onDelete: () => onDelete(int.parse(student[i].id)),
                );
              }),
        ),
      ],
    );
  }
}
