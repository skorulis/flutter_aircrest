import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import "../../store/AppStore.dart";
import "../../store/MainActions.dart";

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() {
    return _LoginWidgetState();
  }
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Username")),
      TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Password")),
      RaisedButton(
          onPressed: () {
            Redux.store.dispatchFuture(LoginAction(
                username: usernameController.text,
                password: passwordController.text));
          },
          child: Text("Login"))
    ]);
  }
}

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() {
    return _RegisterWidgetState();
  }
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Username")),
      TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: "Password")),
      RaisedButton(
          onPressed: () {
            Redux.store.dispatchFuture(RegisterAction(
                username: usernameController.text,
                password: passwordController.text));
            debugPrint("Press");
          },
          child: Text("Register"))
    ]);
  }
}
