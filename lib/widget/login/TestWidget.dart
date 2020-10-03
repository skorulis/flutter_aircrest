import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text("HAHA"),
      RaisedButton(
          onPressed: () {
            print("TEST");
          },
          child: Text("TEST"))
    ]);
  }
}
