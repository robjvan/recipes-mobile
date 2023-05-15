import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController usernameController;

  const UsernameField(this.usernameController, {super.key});

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.grey,
        // fontSize: 24.0,
      ),
      controller: widget.usernameController,
      validator: (final String? val) {
        if (val == '' || val == null) {
          return 'Username cannot be empty'; // TODO(Rob): Add translation strings
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'username'.tr, // TODO(Rob): Add translation strings
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: AppColors.white,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.person,
            color: AppColors.lightBlue,
            size: 28,
          ),
        ),
      ),
    );
  }
}
