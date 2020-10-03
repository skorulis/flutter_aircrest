import 'package:json_annotation/json_annotation.dart';
import "AuthToken.dart";

part 'AuthenticatedUser.g.dart';

@JsonSerializable()
class AuthenticatedUser {
  final String email;
  final AuthToken token;
  final String characterId;

  AuthenticatedUser({this.email, this.token, this.characterId});

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticatedUserToJson(this);
}
