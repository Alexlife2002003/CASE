import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, Color backgroundColor) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    duration: const Duration(milliseconds: 1500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}