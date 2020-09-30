import 'package:Aircrest/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import "../api/UserAPI.dart";

final List<Tab> tabs = <Tab>[
  Tab(text: 'Login'),
  Tab(text: 'Register')
];

class LoginContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: LoginWidget()
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: RegisterWidget()
              )
              ],
          ),
        );
      }),
    );
    
  }


}

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
        ),
        RaisedButton(
          onPressed: () {
            authenticate().then((AuthenticatedUser value) {
                print("Finish " + value.email);
              },
              onError:(e) {
                print("Failure" + e);
              }
            );
            debugPrint("Login2" + usernameController.text);
          },
          child: Text("Login")
        )
      ]
    );
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
        ),
        RaisedButton(
          onPressed: () { 
            debugPrint("Press");
          },
          child: Text("Register")
        )
      ]
    );
  }

}