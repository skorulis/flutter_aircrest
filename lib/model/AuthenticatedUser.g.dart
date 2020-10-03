// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthenticatedUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) {
  return AuthenticatedUser(
    email: json['email'] as String,
    token: json['token'] == null
        ? null
        : AuthToken.fromJson(json['token'] as Map<String, dynamic>),
    characterId: json['characterId'] as String,
  );
}

Map<String, dynamic> _$AuthenticatedUserToJson(AuthenticatedUser instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'characterId': instance.characterId,
    };
