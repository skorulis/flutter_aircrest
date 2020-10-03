import 'package:Aircrest/model/AuthenticatedUser.dart';
import 'package:meta/meta.dart';
import "../model/AuthenticatedUser.dart";
import "../model/EntityNetworkModel.dart";

@immutable
class AppState {
  final AuthenticatedUser authUser;
  final Map<String, EntityNetworkModel> entities;

  AppState({this.authUser, this.entities});
}
