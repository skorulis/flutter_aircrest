import 'package:flutter/material.dart';
import "../../store/AppStore.dart";
import "../../store/MainActions.dart";

class HomeDashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aircrest")),
      body: Column(
        children: [
          Text("I'm home"),
          RaisedButton(
              onPressed: () {
                Redux.store.dispatch(LogoutAction());
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
