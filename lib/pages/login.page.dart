import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/models/models.dart';
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

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightBlue,

      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  AppColors.lightBlue.withOpacity(0.1),
                  AppColors.lightBlue,
                  AppColors.lightBlue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const <double>[0.0, 0.9, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Spacer(),
                  LoginHeader(purpose),
                  const Spacer(),
                  buildFormChild(),
                  const Spacer(),
                  purpose == PagePurpose.login
                      ? buildActionButtons()
                      : CancelButton(cancelBtnFn),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
