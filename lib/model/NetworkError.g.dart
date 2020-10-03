// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NetworkError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkError _$NetworkErrorFromJson(Map<String, dynamic> json) {
  return NetworkError(
    error: json['error'] as bool,
    reason: json['reason'] as String,
  );
}

Map<String, dynamic> _$NetworkErrorToJson(NetworkError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'reason': instance.reason,
    };
