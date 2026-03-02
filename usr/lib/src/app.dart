import 'package:flutter/material.dart';
import 'features/shell/presentation/main_shell.dart';
import 'shared/theme/app_theme.dart';

class HrmsApp extends StatelessWidget {
  const HrmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CouldAI HRMS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainShell(),
      },
    );
  }
}
