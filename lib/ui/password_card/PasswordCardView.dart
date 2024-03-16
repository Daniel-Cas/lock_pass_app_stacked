import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:stacked/stacked.dart';

import '../../app/domain/Password.dart';
import '../common/app_colors.dart';
import 'PasswordCardViewModel.dart';

class PasswordCardView extends StackedView<PasswordCardViewModel> {
  final Password password;

  const PasswordCardView({super.key, required this.password});

  @override
  Widget builder(
    BuildContext context,
    PasswordCardViewModel viewModel,
    Widget? child,
  ) =>
      Card(
        color: kcBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                viewModel.isOpen ? Pixel.eye : Pixel.eyeclosed,
                color: kcSecondaryColor,
              ),
              onTap: viewModel.toggleCard,
              title: !viewModel.isOpen
                  ? Text(
                password.title,
                style: TextStyle(color: kcSecondaryColor),
                )
                  : Text(
                password.password,
                style: TextStyle(color: kcSecondaryColor, fontSize: 24),
              ),
              subtitle: !viewModel.isOpen ? Text(
                password.subtitle,
                style: TextStyle(color: kcSecondaryColor),
              ) : null,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    switchInCurve: Curves.easeInOut,
                    child: viewModel.isCopy
                        ? IconButton(
                            icon:
                                const Icon(Pixel.check, color: Colors.green),
                            onPressed: () {},
                          )
                        : IconButton(
                            icon:
                                const Icon(Pixel.copy, color: kcSecondaryColor),
                            onPressed: () {
                              viewModel.toggleCopy;
                              viewModel.copyToClipboard(password.password);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  PasswordCardViewModel viewModelBuilder(BuildContext context) =>
      PasswordCardViewModel();
}