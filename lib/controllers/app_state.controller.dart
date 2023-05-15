import 'package:get/get.dart';
import 'package:recipes_mobile/models/recipe.model.dart';

class AppStateController {
  static RxBool useDarkMode = true.obs;

  static RxString token = ''.obs;

  static RxList recipes = <Recipe>[].obs;

  /// Toggle dark mode
  static void toggleDarkMode() => useDarkMode.value = !useDarkMode.value;

  // String get token => _token.value;

  // set token(final String newToken) {
  //   _token.value = newToken;
  // }
}
