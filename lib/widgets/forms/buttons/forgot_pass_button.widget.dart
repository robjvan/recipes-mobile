import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class ForgotPassButton extends StatelessWidget {
  final dynamic btnFn;
  const ForgotPassButton(this.btnFn, {super.key});

  @override
  Widget build(final BuildContext context) {
    return TextButton(
      onPressed: btnFn,
      child: Text(
        'forgot-password'.tr,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
