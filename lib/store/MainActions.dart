import 'package:async_redux/async_redux.dart';
import "../api/UserAPI.dart";
import "./AppState.dart";
import 'package:Aircrest/model/AuthenticatedUser.dart';
import 'package:Aircrest/model/EntityNetworkModel.dart';
import 'package:flutter/foundation.dart';

class LoginAction extends ReduxAction<AppState> {
  final String username;
  final String password;

  LoginAction({this.username, this.password});

  @override
  Future<AppState> reduce() async {
    AuthenticatedUser response =
        await UserAPI().authenticate(username, password);
    return AppState(authUser: response);
  }
}

class RegisterAction extends ReduxAction<AppState> {
  final String username;
  final String password;

  RegisterAction({this.username, this.password});

  @override
  Future<AppState> reduce() async {
    AuthenticatedUser response = await UserAPI().register(username, password);
    return AppState(authUser: response);
  }
}

class CreateCharacterAction extends ReduxAction<AppState> {
  final String backgroundId;
  final String name;

  CreateCharacterAction({this.backgroundId, this.name});

  @override
  Future<AppState> reduce() async {
    AuthenticatedUser response =
        await UserAPI().createCharacter(backgroundId, name);
    return AppState(authUser: response);
  }
}

class GetBackgroundsAction extends ReduxAction<AppState> {
  GetBackgroundsAction();

  @override
  Future<AppState> reduce() async {
    print("GET BACKG");
    EntityNetworkGroup response = await UserAPI().getBackgrounds();
    return state.add(response);
  }
}

class LogoutAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    return AppState();
  }
}
