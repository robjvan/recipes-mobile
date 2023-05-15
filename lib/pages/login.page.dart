import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/models/models.dart';
import 'package:recipes_mobile/models/user_credentials.model.dart';
import 'package:recipes_mobile/services/services.dart';
import 'package:recipes_mobile/utilities/utilties.dart';
import 'package:recipes_mobile/widgets/forms/buttons/buttons.dart';
import 'package:recipes_mobile/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  PagePurpose purpose = PagePurpose.login;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    attemptAutoLogin();
  }

  /// Try loading credentials from secure storage and use them to auto-login
  Future<void> attemptAutoLogin() async {
    final UserCredentials? userCreds = await LocalIoService.readCredentials();
    if (userCreds!.username != null) {
      setState(() {
        loading = true;
      });
      unawaited(
        APIService.login(
          userCreds.username!,
          userCreds.password!,
        ),
      );
    }
  }

  Widget buildFormChild() {
    switch (purpose) {
      case PagePurpose.login:
        return const LoginForm();
      case PagePurpose.register:
        return const RegisterForm();
      case PagePurpose.forgotPass:
        return const ForgotPasswordForm();
    }
  }

  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ForgotPassButton(forgotPassBtnFn),
          RegisterButton(registerBtnFn),
        ],
      ),
    );
  }

  void forgotPassBtnFn() {
    setState(() {
      purpose = PagePurpose.forgotPass;
    });
  }

  void registerBtnFn() {
    setState(() {
      if (purpose == PagePurpose.login) {
        purpose = PagePurpose.register;
      } else {
        purpose = PagePurpose.login;
      }
    });
  }

  void cancelBtnFn() {
    setState(() {
      purpose = PagePurpose.login;
    });
  }

  Widget buildLoadingIndicator() {
    return const Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(
            color: AppColors.white,
          ),
          SizedBox(height: 8.0),
          Text(
            'Logging in...',
            style: TextStyle(
              fontSize: 16.0,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.white,
                  AppColors.lightBlue,
                  AppColors.lightBlue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: <double>[0.0, 0.9, 1.0],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Spacer(),
                    LoginHeader(purpose),
                    const Spacer(),
                    loading ? buildLoadingIndicator() : buildFormChild(),
                    const Spacer(),
                    purpose == PagePurpose.login
                        ? buildActionButtons()
                        : CancelButton(cancelBtnFn),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
