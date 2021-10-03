import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questionnaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool test = false;
    return Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                    decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                )),
                Checkbox(value: test, onChanged: (x) => {})
              ]),
        ));
  }
}
