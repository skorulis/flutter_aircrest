// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EntityNetworkModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityNetworkModel _$EntityNetworkModelFromJson(Map<String, dynamic> json) {
  return EntityNetworkModel(
    id: json['id'] as String,
    type: _$enumDecodeNullable(_$EntityTypeEnumMap, json['type']),
    isComplete: json['isComplete'] as bool,
  );
}

Map<String, dynamic> _$EntityNetworkModelToJson(EntityNetworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$EntityTypeEnumMap[instance.type],
      'isComplete': instance.isComplete,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$EntityTypeEnumMap = {
  EntityType.player: 'player',
  EntityType.building: 'building',
  EntityType.town: 'town',
  EntityType.battle: 'battle',
  EntityType.god: 'god',
  EntityType.mission: 'mission',
  EntityType.system: 'system',
  EntityType.lock: 'lock',
  EntityType.item: 'item',
  EntityType.vehicle: 'vehicle',
  EntityType.recipe: 'recipe',
  EntityType.monsterType: 'monsterType',
  EntityType.race: 'race',
  EntityType.skill: 'skill',
  EntityType.lore: 'lore',
  EntityType.dungeonRoom: 'dungeonRoom',
  EntityType.monster: 'monster',
  EntityType.dungeonRoomRef: 'dungeonRoomRef',
  EntityType.educationRef: 'educationRef',
  EntityType.guild: 'guild',
  EntityType.systemAction: 'systemAction',
  EntityType.book: 'book',
  EntityType.spell: 'spell',
  EntityType.npc: 'npc',
  EntityType.dungeon: 'dungeon',
  EntityType.uniqueItem: 'uniqueItem',
  EntityType.characterBackground: 'characterBackground',
  EntityType.estate: 'estate',
  EntityType.structure: 'structure',
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
