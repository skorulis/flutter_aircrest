// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) {
  return AuthToken(
    id: json['id'] as int,
    token: json['token'] as String,
    userID: json['userID'] as String,
  );
}

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'userID': instance.userID,
    };
