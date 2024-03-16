
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class FormPasswordViewModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();
  final _dialogService = locator<DialogService>();

  GlobalKey<FormState> get formKey => _formKey;

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _dialogService.showDialog(
        title: 'Form submitted',
        description: 'Validated and submitted',
      );
    }
  }
}
