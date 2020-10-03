import 'package:json_annotation/json_annotation.dart';
import "../Constants.dart";

part 'EntityNetworkModel.g.dart';

@JsonSerializable()
class EntityNetworkModel {
  final String id;
  final EntityType type;
  final bool isComplete;

  EntityNetworkModel({this.id, this.type, this.isComplete});

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
