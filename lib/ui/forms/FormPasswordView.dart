import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'FormPasswordViewModel.dart';

class FormPasswordView extends StackedView<FormPasswordViewModel> {
  const FormPasswordView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FormPasswordViewModel viewModel,
    Widget? child,
  ) => Form(
    key: viewModel.formKey,
    child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        ElevatedButton(
          onPressed: viewModel.submitForm,
          child: const Text('Submit'),
        ),
      ],
    ),
  );

  @override
  FormPasswordViewModel viewModelBuilder(BuildContext context) =>
      FormPasswordViewModel();
}