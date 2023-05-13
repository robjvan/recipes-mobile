import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class CancelButton extends StatelessWidget {
  final dynamic btnFn;
  const CancelButton(this.btnFn, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: btnFn,
            child: Text(
              'cancel'.tr,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
