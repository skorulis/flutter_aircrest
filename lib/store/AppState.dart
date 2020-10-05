import 'package:Aircrest/Constants.dart';
import 'package:Aircrest/model/AuthenticatedUser.dart';
import 'package:meta/meta.dart';
import "../model/AuthenticatedUser.dart";
import "../model/EntityNetworkModel.dart";

@immutable
class AppState {
  final AuthenticatedUser authUser;
  final Map<String, EntityNetworkModel> entities;

  AppState({this.authUser, this.entities});

  AppState add(EntityNetworkGroup group) {
    Map<String, EntityNetworkModel> mergedMap =
        merge(this.entities, group.entities);
    return AppState(authUser: this.authUser, entities: mergedMap);
  }

  Map<String, EntityNetworkModel> merge(
      Map<String, EntityNetworkModel> old, List<EntityNetworkModel> additions) {
    if (old == null) {
      old = Map<String, EntityNetworkModel>();
    }
    for (EntityNetworkModel model in additions) {
      EntityNetworkModel existing = old[model.id];
      if (existing == null || model.isComplete) {
        old[model.id] = model;
      } else {
        print("Need to do component merge");
      }
    }
    return old;
  }

  List<EntityNetworkModel> ofType(EntityType type) {
    if (this.entities == null) {
      return [];
    }
    List<EntityNetworkModel> result = [];
    this.entities.values.forEach((element) {
      if (element.entityType() == type) {
        result.add(element);
      }
    });
    return result;
  }
}
