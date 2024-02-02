import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/ui/common/theme_bloc/theme_events.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ThemeEvent>(
      (event, emit) {
        if (event is ChangeThemeEvent) {
          emit(event.mode);
        }
      },
    );
  }
}
