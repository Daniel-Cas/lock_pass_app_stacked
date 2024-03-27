import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../common/app_colors.dart';
import 'FormPasswordViewModel.dart';

class FormPasswordView extends StackedView<FormPasswordViewModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final PageController controller = PageController();

  FormPasswordView({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(
    BuildContext context,
    FormPasswordViewModel viewModel,
    Widget? child,) =>
      Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.all(25),
          child: PageView(
            controller: controller,
            children: <Widget>[
              _buildStepOne(context, viewModel),
              _buildStepTwo(context, viewModel),
            ],
          ),
        ),
      );

  Widget _buildStepOne(
    BuildContext context,
    FormPasswordViewModel viewModel,
  ) => Form(
        key: viewModel.getFormKeyStepOne,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  viewModel.namePassword = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  viewModel.descriptionPassword = value!;
                },
              ),
              Row(
                verticalDirection: VerticalDirection.down,
                children: [
                  Padding(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kcErrorColor),
                      ),
                      onPressed: () {
                        completer(DialogResponse(confirmed: false));
                      },
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: kcBackgroundColor),
                      ),
                    ),
                    padding: EdgeInsets.only(top: 30),
                  ),
                  SizedBox(width: 35),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        if (viewModel.getFormKeyStepOne.currentState
                                ?.validate() ??
                            false) {
                          viewModel.getFormKeyStepOne.currentState?.save();
                          controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text('Siguiente'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildStepTwo(
      BuildContext context,
      FormPasswordViewModel viewModel,
  ) => Form(
      key: viewModel.getFormKeyStepTwo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: IconButton(
                    onPressed: () {
                      viewModel.generatePassword();
                    },
                    icon: Icon(Pixel.reload)),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: viewModel.passwordController,
                      enableInteractiveSelection: false,
                      enableSuggestions: false,
                      obscureText: viewModel.obfuscatePassword,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        viewModel.getFormKeyStepTwo.currentState?.save();
                        return null;
                      },
                      onSaved: (value) {
                        viewModel.password = value!;
                      },
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel.obfuscatePassword =
                            !viewModel.obfuscatePassword;
                        viewModel.notifyListeners();
                      },
                      icon: viewModel.obfuscatePassword
                          ? Icon(Pixel.eyeclosed)
                          : Icon(Pixel.eye))
                ],
              ),
              TextFormField(
                controller: viewModel.confirmPasswordController,
                enableInteractiveSelection: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value != viewModel.password) {
                    return 'Passwords do not match';
                  }
                  viewModel.getFormKeyStepTwo.currentState?.save();
                  return null;
                },
                onSaved: (value) {
                  viewModel.confirmPassword = value!;
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      completer(DialogResponse(confirmed: false));
                    },
                    child: IconButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: Icon(Pixel.arrowleft),
                    ),
                  ),
                  SizedBox(width: 40),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (viewModel.getFormKeyStepTwo.currentState?.validate() ??
                            false) {
                          viewModel.submitForm();
                        }
                      },
                      child: Text('Agregar'),
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
      );

  @override
  FormPasswordViewModel viewModelBuilder(BuildContext context) =>
      FormPasswordViewModel(
        request: request,
        completer: completer,
      );
}