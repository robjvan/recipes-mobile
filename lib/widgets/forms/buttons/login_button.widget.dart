import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/pages/pages.dart';
import 'package:recipes_mobile/services/auth.service.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const LoginButton(
    this.usernameController,
    this.passwordController,
    this.formKey, {
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          final http.Response response = await AuthService.login(
            username: usernameController.text,
            password: passwordController.text,
          );

          switch (response.statusCode) {
            case 201:
              // Login successful
              AppStateController.token.value =
                  jsonDecode(response.body)['accessToken'];
              unawaited(Get.offAllNamed(DashboardPage.routeName));
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
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'login'.tr,
          style: const TextStyle(
            fontSize: 32.0,
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
