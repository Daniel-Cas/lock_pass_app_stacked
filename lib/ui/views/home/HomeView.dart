import 'package:flutter/material.dart';
import 'package:lock_pass_app_stacked/ui/forms/FormPasswordView.dart';
import 'package:lock_pass_app_stacked/ui/password_card/PasswordCardView.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:stacked/stacked.dart';
import 'package:lock_pass_app_stacked/ui/common/app_colors.dart';

import '../../../app/domain/Password.dart';
import '../../bottom_bar/BottomBarView.dart';
import 'HomeViewModel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        elevation: 3.0,
        centerTitle: true,
        backgroundColor: kcPrimaryColor,
        title: const Text(
          'Passwords',
          textAlign: TextAlign.center,
          strutStyle: StrutStyle(
            fontSize: 32,
            height: 1.5,
            leadingDistribution: TextLeadingDistribution.even,
          ),
          style: TextStyle(color: kcBackgroundColor, fontSize: 32),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kcBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.only(bottom: 88),
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: viewModel.searchTextController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Pixel.search, color: kcPrimaryColor),
                labelText: 'Buscar...',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

            ),
          ),
          ...viewModel.filteredItems.map((password) => PasswordCardView(password: password)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: viewModel.submitForm,
        child: const Icon(Pixel.addbox, color: kcBackgroundColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBarView()
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) => HomeViewModel();
}