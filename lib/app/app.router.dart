// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:lock_pass_app_stacked/ui/views/home/home_view.dart';
import 'package:lock_pass_app_stacked/ui/views/finger_auth/FingerprintAuthView.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class Routes {
  static const fingerAuth = '/auth';
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const all = <String>{
    homeView,
    startupView,
    fingerAuth,
  };
}

class StackedRouter extends RouterBase {
  final _routes = <RouteDef>[
    RouteDef(
      Routes.homeView,
      page: HomeView,
    ),
    RouteDef(
      Routes.fingerAuth,
      page: FingerAuthView,
    ),
  ];

  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    FingerAuthView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FingerAuthView(),
        settings: data,
        allowSnapshotting: false,
      );
    },
  };

  @override
  List<RouteDef> get routes => _routes;

  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition
    );
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
