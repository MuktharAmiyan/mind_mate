import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/theme.dart';
import 'package:mind_mate/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mind Mate',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      routerConfig: router(),
    );
  }
}
