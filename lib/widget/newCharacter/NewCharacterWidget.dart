import 'package:Aircrest/model/EntityNetworkModel.dart';
import 'package:flutter/material.dart';
import "../../store/AppStore.dart";
import "../../store/MainActions.dart";

class NewCharacterWidget extends StatefulWidget {
  @override
  _NewCharacterState createState() {
    return _NewCharacterState();
  }
}

class _NewCharacterState extends State<NewCharacterWidget> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print("T1");
    super.didChangeDependencies();
    Redux.store.dispatchFuture(GetBackgroundsAction());
  }

  @override
  Widget build(BuildContext context) {
    print("TERS");

    Redux.store.dispatchFuture(GetBackgroundsAction());
    return Scaffold(
      appBar: AppBar(title: Text("Aircrest")),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name")),
          RaisedButton(
              onPressed: () {
                Redux.store.dispatchFuture(GetBackgroundsAction());
                //CreateCharacterAction(backgroundId: null, name: null));
              },
              child: Text("Create")),
          Text("TEST1")
        ],
      ),
    );
  }
}
