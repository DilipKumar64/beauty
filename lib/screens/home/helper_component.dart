import 'package:flutter/material.dart';

class HelperComponent {
  static showSnackbar(BuildContext context, String mesage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mesage),
      ),
    );
  }
}
