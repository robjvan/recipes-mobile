import 'package:flutter/material.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordField(this.passwordController, {super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscurePass = true;

  void btnFn() {}
  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.grey,
        fontSize: 24.0,
      ),
      obscureText: obscurePass,
      controller: widget.passwordController,
      validator: (final String? val) {
        if (val == '' || val == null) {
          return 'Password cannot be empty'; // TODO(Rob): Add translation strings
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.lock,
            color: AppColors.lightBlue,
            size: 28,
          ),
        ),
        suffix: GestureDetector(
          onTap: () {
            setState(() {
              obscurePass = !obscurePass;
            });
          },
          child: Transform.translate(
            offset: const Offset(-12.0, 6.0),
            child: Icon(
              obscurePass ? Icons.visibility : Icons.visibility_off,
              size: 28,
              color: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
