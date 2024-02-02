import 'package:flutter/material.dart';

abstract class AppTheme {
  AppTheme._();

  static ColorScheme color(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static TextTheme text(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
