import 'package:Aircrest/model/AppState.dart';
import 'package:flutter/material.dart';
import "login/LoginWidget.dart";
import 'package:redux/redux.dart';
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
      home: LoginContainerWidget()
    );
  }
}
