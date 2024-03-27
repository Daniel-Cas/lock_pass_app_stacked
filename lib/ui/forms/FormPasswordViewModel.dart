
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:lock_pass_app_stacked/app/domain/Password.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FormPasswordViewModel extends BaseViewModel {
  late final DialogRequest request;
  late final Function(DialogResponse) completer;
  final _formKeyStepOne = GlobalKey<FormState>();
  final _formKeyStepTwo = GlobalKey<FormState>();
  String namePassword = '';
  String password = '';
  String confirmPassword = '';
  String descriptionPassword = '';
  var logger = Logger(
    printer: PrettyPrinter(),
  );
  bool obfuscatePassword = true;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  FormPasswordViewModel({
    required this.request,
    required this.completer,
  });

  get getFormKeyStepOne => _formKeyStepOne;
  get getFormKeyStepTwo => _formKeyStepTwo;

  void submitForm() {
    if (_formKeyStepTwo.currentState?.validate() ?? false) {
      completer(
        DialogResponse(
          data: Password(namePassword, password, descriptionPassword),
          confirmed: true,
        )
      );
    }
  }

  void generatePassword() {
    var newPassword = randomPassword();

    password = newPassword;
    confirmPassword = newPassword;
    passwordController.text = newPassword;
    confirmPasswordController.text = newPassword;

    notifyListeners();
  }

  String randomPassword() {
    var newPassword = '';
    var random = Random();

    for (var i = 0; i < 10; i++) {
      var number = random.nextInt(10) * 1;
      var lowerLetter = String.fromCharCode(random.nextInt(26) + 97);
      var upperLetter = String.fromCharCode(random.nextInt(26) + 65);
      var symbol = String.fromCharCode(random.nextInt(14) + 33);
      newPassword += "$number$lowerLetter$upperLetter$symbol";
    }

    logger.i(newPassword);

    return newPassword;
  }
}
