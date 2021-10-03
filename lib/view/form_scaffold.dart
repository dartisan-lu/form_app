import 'package:flutter/material.dart';
import 'package:form_app/view/widget/questionnaire.dart';

class FormScaffold extends StatelessWidget {
  const FormScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Form App')),
      body: Questionnaire(),
    );
  }
}
