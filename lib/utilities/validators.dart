class AppValidators {
  /// Ensures value is a valid number
  static dynamic isNumber(final String value) {
    try {
      double.parse(value);
    } on Exception catch (_) {
      return 'Value must be a valid number';
    }
    return null;
  }

  // Ensures value is a valid IP address
  static bool isIP(final String input) {
    final RegExp _ipRegex = RegExp(
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
    );

    return _ipRegex.hasMatch(input);
  }
}
