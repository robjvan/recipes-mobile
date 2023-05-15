import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipes_mobile/widgets/forms/buttons/login_button.widget.dart';
import 'package:recipes_mobile/widgets/forms/fields/fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool loading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                UsernameField(usernameController),
                const SizedBox(height: 8.0),
                PasswordField(passwordController),
                const SizedBox(height: 32.0),
                LoginButton(
                  usernameController,
                  passwordController,
                  formKey,
                ),
                // buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
