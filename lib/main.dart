import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipes_mobile/services/db.service.dart';
import 'package:recipes_mobile/utilities/utilties.dart';
// import 'package:recipes_mobile/utilities/utilities.dart';

final Uri serverUrl = Uri.parse('http://192.168.0.88:3000');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  /// Lock app in portrait orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Initialize local DB
  unawaited(DBService.openDB());

  /// Launch the app
  runApp(MyApp());
}

@immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return GetMaterialApp(
      title: 'app_title'.tr,
      translations: AppTranslations(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      getPages: AppRoutes.getPages,
      theme: AppTheme.themeData,
      initialRoute: AppRoutes.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
