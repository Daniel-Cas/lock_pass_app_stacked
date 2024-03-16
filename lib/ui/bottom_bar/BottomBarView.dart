import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:stacked/stacked.dart';

import '../common/app_colors.dart';
import 'BottomBarViewModel.dart';

class BottomBarView extends StackedView<BottomBarViewModel> {

  @override
  Widget builder(
      BuildContext context,
      BottomBarViewModel viewModel,
      Widget? child,
  ) => BottomAppBar(
    shape: const CircularNotchedRectangle(),
    color: kcPrimaryColor,
    child: IconTheme(
      data: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Pixel.infobox),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kcBackgroundColor),
            ),
            onPressed: viewModel.showDialog,
          ),
          IconButton(
            icon: const Icon(Pixel.arrowup),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(kcBackgroundColor),
            ),
            onPressed: viewModel.showBottomSheet,
          ),
        ],
      ),
      )
    );

  @override
  BottomBarViewModel viewModelBuilder(BuildContext context) =>
      BottomBarViewModel();
}