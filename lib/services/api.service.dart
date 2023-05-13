import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/main.dart';

@immutable
class APIService {
  static const String recipesUrl = 'api/v1/recipes';

  static Future<http.Response> fetchRecipes(final int userId) {
    return http.get(
      serverUrl.resolve(recipesUrl),
      headers: <String, String>{
        'Authorization': 'Bearer ${AppStateController.token.value}',
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
  }
}
