import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/main.dart';
import 'package:recipes_mobile/pages/login.page.dart';
import 'package:recipes_mobile/services/local_io.service.dart';

@immutable
class AuthService {
  static Future<http.Response> login({
    required final String username,
    required final String password,
  }) {
    return http.post(
      serverUrl.resolve('auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'password': password,
          'platform': 'android'
        },
      ),
    );
  }

  static Future<http.Response> register({
    required final String username,
    required final String password,
    required final String name,
    final int subTier = 0,
  }) {
    return http.post(
      serverUrl.resolve('auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'username': username,
          'password': password,
          'platform': 'android',
          'name': name,
          'subscriptionTier': subTier,
        },
      ),
    );
  }

  static Future<void> logout() async {
    AppStateController.token.value = '';
    await LocalIoService.clearCredentials();
    unawaited(Get.offAndToNamed(LoginPage.routeName));
  }
}
