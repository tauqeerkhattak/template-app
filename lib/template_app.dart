import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_app/ui/common/theme_bloc/theme_bloc.dart';
import 'package:template_app/ui/pages/home/bloc/home_bloc.dart';
import 'package:template_app/ui/pages/home/home_page.dart';
import 'package:template_app/ui/theme/dark/dark_theme.dart';
import 'package:template_app/ui/theme/light/light_theme.dart';

class TemplateApp extends StatelessWidget {
  const TemplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeBloc, ThemeMode>(
          bloc: BlocProvider.of<ThemeBloc>(context),
          builder: (context, value) {
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: value,
              home: const HomePage(),
              builder: (context, child) {
                // Only those providers should be given here that are used throughout
                // the app, for providers that are specific to a single page, it should
                // be initialized in the route for that page.
                return BlocProvider(
                  create: (context) => HomeBloc(),
                  child: child!,
                );
              },
            );
          },
        );
      }),
    );
  }
}
