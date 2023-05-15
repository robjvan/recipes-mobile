import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/pages/pages.dart';

@immutable
class AppRoutes {
  static const String initialRoute = LoginPage.routeName;

  static final List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: DashboardPage.routeName,
      page: DashboardPage.new,
    ),
    GetPage<dynamic>(
      name: LoginPage.routeName,
      page: LoginPage.new,
    ),
    GetPage<dynamic>(
      name: CollectionPage.routeName,
      page: CollectionPage.new,
    ),
    GetPage<dynamic>(
      name: FavoritesPage.routeName,
      page: FavoritesPage.new,
    ),
    GetPage<dynamic>(
      name: SettingsPage.routeName,
      page: SettingsPage.new,
    ),
  ];
}
