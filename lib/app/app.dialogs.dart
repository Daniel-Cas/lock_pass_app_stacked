// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:lock_pass_app_stacked/ui/forms/FormPasswordView.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType {
  infoAlert,
  form,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.form: (context, request, completer) =>
        FormPasswordView(request: request, completer: completer,),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
