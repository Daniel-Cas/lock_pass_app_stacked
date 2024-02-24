import 'package:flutter/material.dart';
import 'package:lock_pass_app_stacked/app/app.bottomsheets.dart';
import 'package:lock_pass_app_stacked/app/app.dialogs.dart';
import 'package:lock_pass_app_stacked/app/app.locator.dart';
import 'package:lock_pass_app_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.fingerAuth,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
