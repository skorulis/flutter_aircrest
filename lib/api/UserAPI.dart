import 'package:Aircrest/model/EntityNetworkModel.dart';
import 'package:Aircrest/model/NetworkError.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "../model/AuthenticatedUser.dart";
import "../model/NetworkError.dart";
import "../store/AppStore.dart";

class BaseAPI {
  String _makeURL(String path) {
    return "http://localhost:7000/api/" + path;
  }

  Map<String, dynamic> _fixHeaders(Map<String, String> headers) {
    print("FIX1");
    if (headers == null) {
      headers = Map<String, String>();
    }
    print("FIX2");
    String token = Redux.store.state?.authUser?.token?.token;
    if (token != null) {
      print("TEEST2");
      headers["Authorization"] = "Bearer " + token;
      print("Maybe");
    }
    print(headers);
    return headers;
  }

  http.Response _finish(http.Response response) {
    print("FINISH");
    String responseBody = response.body;
    print("RESPONSE: $responseBody");
    if (response.statusCode >= 400) {
      NetworkError error = NetworkError.fromJson(json.decode(responseBody));
      throw error;
    }
    return response;
  }

  Future<http.Response> defaultPost(String path,
      {Map<String, String> headers, body}) async {
    String fullURL = _makeURL(path);
    headers = _fixHeaders(headers);
    print("POST : $fullURL with $body");
    final http.Response response =
        await http.post(fullURL, body: body, headers: headers);
    return _finish(response);
  }

  Future<http.Response> defaultGet(String path,
      {Map<String, String> headers, body}) async {
    String fullURL = _makeURL(path);
    headers = _fixHeaders(headers);
    print("GET : $fullURL");
    final response = await http.get(fullURL, headers: headers);
    return _finish(response);
  }
}

class UserAPI extends BaseAPI {
  Future<AuthenticatedUser> authenticate(
      String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    final response =
        await defaultPost('user/login', headers: {"Authorization": basicAuth});
    return AuthenticatedUser.fromJson(json.decode(response.body));
  }

  Future<AuthenticatedUser> register(String username, String password) async {
    Map<String, dynamic> model = <String, dynamic>{
      'email': username,
      'password': password,
    };

    final response = await defaultPost('user/register', body: model);
    return AuthenticatedUser.fromJson(json.decode(response.body));
  }

  Future<AuthenticatedUser> createCharacter(
      String backgroundId, String name) async {
    Map<String, dynamic> model = <String, dynamic>{
      'backgroundId': backgroundId,
      'name': name,
    };

    final response = await defaultPost('user/character', body: model);
    return AuthenticatedUser.fromJson(json.decode(response.body));
  }

  Future<EntityNetworkGroup> getBackgrounds() async {
    final response = await defaultGet("user/backgrounds");
    return EntityNetworkGroup.fromJson(json.decode(response.body));
  }
}
