import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipes_mobile/controllers/app_state.controller.dart';
import 'package:recipes_mobile/models/user_credentials.model.dart';
import 'package:recipes_mobile/pages/pages.dart';
import 'package:recipes_mobile/services/auth.service.dart';
import 'package:recipes_mobile/services/services.dart';
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
          unawaited(
            APIService.login(
              usernameController.text,
              passwordController.text,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'login'.tr,
          style: const TextStyle(
            fontSize: 18.0,
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
