import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/pages/pages.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

List<Widget> navLinks = <Widget>[
  ListTile(
    onTap: () {
      Get.offAndToNamed(DashboardPage.routeName);
    },
    leading: const Icon(
      Icons.dashboard_outlined,
      color: AppColors.lightBlue,
    ),
    title: Text('dashboard'.tr), // TODO(Rob): Add translation strings
  ),
  ListTile(
    onTap: () {
      Get.offAndToNamed(CollectionPage.routeName);
    },
    leading: const Icon(
      Icons.library_books_outlined,
      color: AppColors.lightBlue,
    ),
    title: Text('collection'.tr), // TODO(Rob): Add translation strings
  ),
  ListTile(
    onTap: () {
      Get.offAndToNamed(FavoritesPage.routeName);
    },
    leading: const Icon(
      Icons.favorite_border_outlined,
      color: AppColors.lightBlue,
    ),
    title: Text('favorites'.tr), // TODO(Rob): Add translation strings
  ),
  ListTile(
    onTap: () {
      Get.offAndToNamed(SettingsPage.routeName);
    },
    leading: const Icon(
      Icons.settings_outlined,
      color: AppColors.lightBlue,
    ),
    title: Text('settings'.tr), // TODO(Rob): Add translation strings
  ),
];
