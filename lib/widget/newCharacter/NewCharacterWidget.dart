import 'package:flutter/material.dart';
import "../../store/AppStore.dart";

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
  Widget build(BuildContext context) {
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
                Redux.store.dispatchFuture(
                    CreateCharacterAction(backgroundId: null, name: null));
              },
              child: Text("Create"))
        ],
      ),
    );
  }
}
