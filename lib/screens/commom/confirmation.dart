import 'package:flutter/material.dart';

Future<dynamic> showConfirmationDialog(BuildContext context, {
  String title = "Atenção!",
  String content = "Você deseja realmente executar essa operação?",
  String affirmative = "Confirmar", 
}) {
  return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: const Text("Cancelar")
            ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), 
            child: Text(
              affirmative.toUpperCase(),
              style: const TextStyle(
                color: Color.fromARGB(255, 111, 157, 255),
                fontWeight: FontWeight.bold
              ),
              ),
            ),
        ],
      );
    });
}