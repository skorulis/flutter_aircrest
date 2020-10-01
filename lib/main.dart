import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'store/AppState.dart';
import "login/LoginWidget.dart";
import "store/AppStore.dart";

void main() {
  Redux.init();

  runApp(MainAppWidget(store: Redux.store));
}

class MainAppWidget extends StatelessWidget {
  final Store<AppState> store;

  MainAppWidget({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aircrest',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginContainerWidget());
  }
}
