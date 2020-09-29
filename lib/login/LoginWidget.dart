import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[
        TextField(
          controller: usernameController, 
          decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Username" )
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Password" )
        )
      ]
    );
  }

}