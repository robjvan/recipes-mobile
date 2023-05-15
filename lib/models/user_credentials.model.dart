class UserCredentials {
  final String? username;
  final String? password;
  UserCredentials({
    required this.username,
    required this.password,
  });

  factory UserCredentials.fromMap(final Map<String, dynamic> json) {
    return UserCredentials(
      username: json['username'],
      password: json['password'],
    );
  }
}
