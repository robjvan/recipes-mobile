import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipes_mobile/models/models.dart';
import 'package:recipes_mobile/utilities/utilties.dart';

class LoginHeader extends StatelessWidget {
  final PagePurpose purpose;

  const LoginHeader(this.purpose, {super.key});

  @override
  Widget build(final BuildContext context) {
    // String label = '';
    // switch (purpose) {
    //   case PagePurpose.register:
    //     label = 'register'.tr;
    //     break;
    //   case PagePurpose.forgotPass:
    //     label = 'reset-password'.tr;
    //     break;
    //   case PagePurpose.login:
    //   default:
    //     label = 'login'.tr;
    //     break;
    // }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/icon/icon.png',
            height: 200,
          ),
          Text(
            'app_title'.tr,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 56.0,
              fontFamily: 'Hero',
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.black54,
                  offset: Offset(0, 1),
                  blurRadius: 20,
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
