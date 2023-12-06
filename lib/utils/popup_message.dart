import 'package:flutter/material.dart';

class PopupMessage {
  static void showStudentAddedPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Usuário Adicionado'),
          content: const Text('O usuário foi adicionado com sucesso.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showStudentDeletedPopup({
    required BuildContext context,
    required Function()? onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Você realmente deseja excluir este cadastro?'),
          actions: <Widget>[
            TextButton(
              onPressed: onConfirm,
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }
}
