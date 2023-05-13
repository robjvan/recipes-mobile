import 'package:get/get.dart';

class AppStateController {
  static RxBool useDarkMode = true.obs;

  static RxString token = ''.obs;

  /// Toggle dark mode
  static void toggleDarkMode() => useDarkMode.value = !useDarkMode.value;

  // String get token => _token.value;

  // set token(final String newToken) {
  //   _token.value = newToken;
  // }
}
