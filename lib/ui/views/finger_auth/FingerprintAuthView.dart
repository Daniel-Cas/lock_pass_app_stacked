import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'FingerAuthViewModel.dart';

class FingerAuthView extends StackedView<FingerAuthViewModel> {
  const FingerAuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      FingerAuthViewModel viewModel,
      Widget? child,
  ) => Scaffold(
    backgroundColor: kcBackgroundColor,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Password safer',
            style: TextStyle(
                fontSize: 60,
                color: kcSecondaryColor,
                fontWeight: FontWeight.w900
            ),
          ),
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
  FingerAuthViewModel viewModelBuilder(
      BuildContext context,
  ) => FingerAuthViewModel();
}

