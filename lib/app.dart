import 'package:books/config/router/router.dart';
import 'package:books/config/themes/dark_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Library',
      darkTheme: darkTheme,

      routerConfig: AppRouter().router,
     
    );
  }
}