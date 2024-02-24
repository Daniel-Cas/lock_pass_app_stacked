import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:lock_pass_app_stacked/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) =>
      Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Password safer',
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white60,
                    fontWeight: FontWeight.w900
                ),
              ),
              verticalSpaceLarge,
              verticalSpaceLarge,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpaceMedium,
                  horizontalSpaceSmall,
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/home_image.png'),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
