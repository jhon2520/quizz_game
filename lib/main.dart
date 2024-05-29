import 'package:flutter/material.dart';
import 'package:trivia_app/config/index.dart';
import 'package:trivia_app/config/router/index.dart';
import 'package:trivia_app/presentation/services/index.dart'
    show initServiceLocator;

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: AppGoRouter.router(),
      theme: AppTheme.getTheme(),
    );
  }
}
