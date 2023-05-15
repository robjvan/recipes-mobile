import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:recipes_mobile/models/user_credentials.model.dart';

class LocalIoService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  /// Store user credentials for auto-login purposes
  static Future<void> storeCredentials(final UserCredentials userCreds) async {
    await _secureStorage.write(
      key: 'username',
      value: userCreds.username,
    );
    await _secureStorage.write(
      key: 'password',
      value: userCreds.password,
    );
  }

  /// Load user credentials for auto-login purposes
  static Future<UserCredentials?> readCredentials() async {
    late UserCredentials userCreds;

    try {
      final Map<String, dynamic> storedCreds = await _secureStorage.readAll();
      userCreds = UserCredentials.fromMap(storedCreds);
    } on Exception catch (e) {
      print('Could not load user credentials from secure storage, $e');
    }

    return userCreds;
  }

  /// Clear saved user credentials
  static Future<void> clearCredentials() async => _secureStorage.deleteAll();

  static void saveUserSettings() {}

  static void loadUserSettings() {}
}
