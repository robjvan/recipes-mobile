import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/main.dart';
import 'package:recipes_mobile/models/user_credentials.model.dart';
import 'package:recipes_mobile/pages/pages.dart';
import 'package:recipes_mobile/services/services.dart';

@immutable
class APIService {
  static const String recipesUrl = 'api/v1/recipes';

  static Future<http.Response> fetchRecipes() {
    return http.get(
      serverUrl.resolve(recipesUrl),
      headers: <String, String>{
        'Authorization': 'Bearer ${AppStateController.token.value}',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
  }

  static Future<void> login(
      final String username, final String password) async {
    final http.Response response = await AuthService.login(
      username: username,
      password: password,
    );

    switch (response.statusCode) {
      case 201:
        // Login successful, store token from server
        AppStateController.token.value =
            jsonDecode(response.body)['accessToken'];
        unawaited(Get.offAllNamed(DashboardPage.routeName));

        /// Store our credentials for auto-login
        unawaited(
          LocalIoService.storeCredentials(
            UserCredentials(
              username: username,
              password: password,
            ),
          ),
        );
        break;

      case 401:
        // Incorrect credentials
        unawaited(
          Get.dialog(
            const Dialog(
              child: Text(
                'Wrong username or password, try again', // TODO(Rob): Add translation strings
                style: TextStyle(),
              ),
            ),
          ),
        );
        break;

      case 500:
        // Server error
        unawaited(
          Get.dialog(
            const Dialog(
              child: Text(
                'Server error, try again later', // TODO(Rob): Add translation strings
                style: TextStyle(),
              ),
            ),
          ),
        );
        break;
    }
  }
}
