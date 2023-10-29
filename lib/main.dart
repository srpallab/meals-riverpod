import 'package:flutter/material.dart';
import 'package:meals_riverpod/screens/tabs_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
    );
  }
}
