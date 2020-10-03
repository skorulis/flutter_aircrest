import 'package:Aircrest/model/AuthenticatedUser.dart';
import 'package:meta/meta.dart';
import "../model/AuthenticatedUser.dart";

@immutable
class AppState {
  final AuthenticatedUser authUser;

  AppState({this.authUser});
}
