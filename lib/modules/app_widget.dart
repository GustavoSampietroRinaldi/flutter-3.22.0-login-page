import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Login App',
      theme: AppTheme.lightTheme,
      routerConfig: Modular.routerConfig,
    );
  }
}
