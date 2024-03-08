import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final String content;
  const AlertWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Alert"),
      content: Text(content),
      // content: const Text("Fill all fields."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}
