import 'package:flutter/material.dart';

void showSnackBar({
  required String message,
  required BuildContext context,
  required Color backGroundColor,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: backGroundColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}