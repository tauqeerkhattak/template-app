import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode mode;

  ChangeThemeEvent(this.mode);
}
