import 'package:flutter/material.dart';
import 'package:form_app/theme/app_theme.dart';
import 'package:form_app/view/form_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FORM App',
      theme: defaultTheme,
      home: const FormScaffold(),
    );
  }
}
