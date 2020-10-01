import 'package:http/http.dart' as http;
import 'dart:convert';
import "../model/AuthenticatedUser.dart";

Future<AuthenticatedUser> authenticate(username, password) async {
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final response = await http.post('http://localhost:7000/api/user/login',
      headers: {"Authorization": basicAuth});

  if (response.statusCode < 400) {
    return AuthenticatedUser.fromJson(json.decode(response.body));
  } else {
    throw ('Failed to load album');
  }
}
