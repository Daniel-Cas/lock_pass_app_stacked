import 'dart:io';

import 'package:local_auth/local_auth.dart';
import 'package:lock_pass_app_stacked/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class FingerAuthViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final LocalAuthentication _localAuth = LocalAuthentication();

  FingerAuthViewModel() {
    authenticateBiometrics();
  }

  Future<void> authenticateBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Let me see, if you are I',
      );
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      await _navigationService.replaceWith(Routes.homeView);
    } else {
      exit(0);
    }
  }
}