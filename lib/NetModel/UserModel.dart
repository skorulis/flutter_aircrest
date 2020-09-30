

class AuthenticatedUser {
  final String email;
  
  AuthenticatedUser({this.email});

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) {
    return AuthenticatedUser(
      email: json["email"]
    );
  }
}

