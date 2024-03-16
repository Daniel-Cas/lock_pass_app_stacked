import 'package:flutter/cupertino.dart';
import 'package:lock_pass_app_stacked/app/domain/Password.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  String get counterLabel => 'Counter is: $_counter';
  List<Password> items = [
    Password(
      'Meta',
      '123',
      'The password about meta'
    ),
    Password(
      'Instagram',
      '345',
      'The password about instagram'
    ),
    Password(
      'Outlook',
      '678',
      'The password about outlook'
    ),
    Password(
      'Google suite',
      '910',
      'The password about google suite'
    ),
    Password(
      'Github',
      '910',
      'The password about github'
    )
  ];
  final searchTextController = TextEditingController();
  List<Password> filteredItems = [];
  int _counter = 0;

  HomeViewModel() {
    filteredItems = items;
    searchTextController.addListener(searchListener);
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void addPassword() {
    items.add(Password(
      'New password',
      '123',
      'The password about new password'
    ));
    rebuildUi();
  }

  void searchListener() {
    String searchText = searchTextController.text;

    if (searchText.isEmpty) {
      filteredItems = items;
    } else {
      logger.i("searchText: $searchText");
      filteredItems = items.where((password) {
        return password.title.contains(searchText);
      }).toList();
    }
    notifyListeners();
  }
}
