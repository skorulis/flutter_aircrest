import 'package:Aircrest/model/AuthenticatedUser.dart';
import 'package:flutter/foundation.dart';
import "./AppState.dart";
import 'package:async_redux/async_redux.dart';
import "../api/UserAPI.dart";

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    return _store;
  }

  static init() {
    _store = Store<AppState>(
        initialState: AppState(email: null, test: 1),
        errorObserver: MyErrorObserver<AppState>());
  }
}

class MyErrorObserver<St> implements ErrorObserver<St> {
  @override
  bool observe(Object error, StackTrace stackTrace, ReduxAction<St> action,
      Store store) {
    print("Error thrown during $action: $error");
    return false;
  }
}

class TestAction extends ReduxAction<AppState> {
  AppState reduce() {
    return this.state;
  }
}

class LoginAction extends ReduxAction<AppState> {
  final String username;
  final String password;

  LoginAction({this.username, this.password});

  @override
  Future<AppState> reduce() async {
    debugPrint("Start reduce");
    AuthenticatedUser response = await authenticate(username, password);
    debugPrint("Finish reduce");
    return AppState(email: response.email, test: 1);
  }
}
