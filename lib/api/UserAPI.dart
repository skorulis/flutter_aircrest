import 'package:Aircrest/model/NetworkError.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "../model/AuthenticatedUser.dart";
import "../model/NetworkError.dart";

class BaseAPI {
  Future<http.Response> defaultPost(String path,
      {Map<String, String> headers, body}) async {
    String baseURL = "http://localhost:7000/api/";
    String fullURL = baseURL + path;
    print("POST : $fullURL with $body");
    final response = await http.post(fullURL, body: body, headers: headers);
    String responseBody = response.body;
    print("RESPONSE: $responseBody");
    if (response.statusCode >= 400) {
      NetworkError error = NetworkError.fromJson(json.decode(responseBody));
      throw error;
    }
    return response;
  }
}

class UserAPI extends BaseAPI {
  Future<AuthenticatedUser> authenticate(username, password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final response =
        await defaultPost('user/login', headers: {"Authorization": basicAuth});
    return AuthenticatedUser.fromJson(json.decode(response.body));
  }

  Future<AuthenticatedUser> register(username, password) async {
    Map<String, dynamic> model = <String, dynamic>{
      'email': username,
      'password': password,
    };

    final response = await defaultPost('user/register', body: model);
    return AuthenticatedUser.fromJson(json.decode(response.body));
  }
}
