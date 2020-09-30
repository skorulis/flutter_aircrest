import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable()
class AuthToken {
  int id;
  String token;
  String userID;

  AuthToken({this.id, this.token, this.userID});

  factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}