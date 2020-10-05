import "./AppState.dart";
import 'package:async_redux/async_redux.dart';

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    return _store;
  }

  static init() {
    _store = Store<AppState>(
        initialState: AppState(), errorObserver: MyErrorObserver<AppState>());
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
    return Redux.store.state;
  }
}
