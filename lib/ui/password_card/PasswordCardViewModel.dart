import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';

class PasswordCardViewModel extends BaseViewModel {
  late String title;
  late String subtitle;
  bool isOpen = false;
  bool isCopy = false;

  void toggleCard() {
    isOpen = !isOpen;
    notifyListeners();
  }

  void toggleCopy() {
    isCopy = !isCopy;
    notifyListeners();
    Timer(Duration(milliseconds: 500), () {
      isCopy = !isCopy;
      notifyListeners();
    });
  }

  Future<void> copyToClipboard(String password) async {
    await Clipboard.setData(ClipboardData(text: password));
  }
}