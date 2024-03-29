import 'package:lock_pass_app_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:lock_pass_app_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:lock_pass_app_stacked/ui/views/finger_auth/FingerprintAuthView.dart';
import 'package:lock_pass_app_stacked/ui/views/home/HomeView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: FingerAuthView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
