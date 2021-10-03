import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Questionnaire extends StatelessWidget {
  const Questionnaire({Key? key}) : super(key: key);

  FormGroup get form => fb.group(<String, Object>{
        'name': ['', Validators.required],
        'animal': ['CAT'],
        'condition': [false, Validators.required],
        'mobile': ['', Validators.required],
        'birthday': DateTime.now(),
      });

  submit(FormGroup form, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${form.value}'),
            actions: [
              MaterialButton(
                  child: const Text("close"),
                  onPressed: () {
                    Navigator.of(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.all(20),
        child: ReactiveFormBuilder(
            form: () => form,
            builder: (context, form, child) {
              return Column(children: [
                ReactiveTextField<String>(
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  validationMessages: (errors) => {
                    ValidationMessage.required: 'Name must not be empty',
                  },
                ),
                ReactiveDropdownField<String>(
                  formControlName: 'mobile',
                  decoration: const InputDecoration(
                    labelText: 'Which Handy do you prefer?',
                  ),
                  items: const [
                    DropdownMenuItem(value: 'APPLE', child: Text('Apple')),
                    DropdownMenuItem(value: 'ANDROID', child: Text('Android')),
                  ],
                ),
                Row(
                  children: [
                    Flexible(child: Text('Prefered animal: ')),
                    Flexible(
                        child: ReactiveRadioListTile(
                      formControlName: 'animal',
                      title: const Text('Cat'),
                      value: 'CAT',
                    )),
                    Flexible(
                        child: ReactiveRadioListTile(
                      formControlName: 'animal',
                      title: const Text('Dog'),
                      value: 'DOG',
                      toggleable: true,
                    )),
                  ],
                ),
                ReactiveTextField<DateTime>(
                  formControlName: 'birthday',
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    suffixIcon: ReactiveDatePicker<DateTime>(
                      formControlName: 'birthday',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2030),
                      builder: (context, picker, child) {
                        return IconButton(
                          onPressed: picker.showPicker,
                          icon: const Icon(Icons.date_range),
                        );
                      },
                    ),
                  ),
                ),
                Row(children: [
                  ReactiveCheckbox(
                    formControlName: 'condition',
                  ),
                  const Text('Accept global conditions')
                ]),
                ElevatedButton(
                  onPressed: () => submit(form, context),
                  child: const Text('Submit'),
                )
              ]);
            }));
  }
}
