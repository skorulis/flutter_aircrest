// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntityNetworkModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityNetworkModel _$EntityNetworkModelFromJson(Map<String, dynamic> json) {
  return EntityNetworkModel(
    id: json['id'] as String,
    type: json['type'] as int,
    isComplete: json['isComplete'] as bool,
  );
}

Map<String, dynamic> _$EntityNetworkModelToJson(EntityNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'isComplete': instance.isComplete,
    };

EntityNetworkGroup _$EntityNetworkGroupFromJson(Map<String, dynamic> json) {
  return EntityNetworkGroup(
    entities: (json['entities'] as List)
        ?.map((e) => e == null
            ? null
            : EntityNetworkModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EntityNetworkGroupToJson(EntityNetworkGroup instance) =>
    <String, dynamic>{
      'entities': instance.entities,
    };
