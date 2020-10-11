import 'package:json_annotation/json_annotation.dart';
import "../Constants.dart";

part 'EntityNetworkModel.g.dart';

@JsonSerializable()
class EntityNetworkModel {
  final String id;
  final int type;
  final bool isComplete;

  EntityNetworkModel({this.id, this.type, this.isComplete});

  EntityType entityType() {
    return EntityType.values[type];
  }

  bool operator ==(other) => other is EntityNetworkModel && other.id == id;

  int get hashCode => id.hashCode;

  factory EntityNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$EntityNetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$EntityNetworkModelToJson(this);
}

@JsonSerializable()
class EntityNetworkGroup {
  final List<EntityNetworkModel> entities;

  EntityNetworkGroup({this.entities});
  factory EntityNetworkGroup.fromJson(Map<String, dynamic> json) =>
      _$EntityNetworkGroupFromJson(json);
  Map<String, dynamic> toJson() => _$EntityNetworkGroupToJson(this);
}
