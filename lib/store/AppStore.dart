import "../model/AppState.dart";
import 'package:redux/redux.dart';

AppState appReducer(AppState state, dynamic action) {
  return state;
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    return _store;
  }

  static init() {
    _store = Store<AppState>(
      appReducer,
      initialState: AppState(email:null)
    );
  }


}