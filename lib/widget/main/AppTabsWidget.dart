import 'package:flutter/material.dart';
import "../login/LoginWidget.dart";
import "../login/TestWidget.dart";

final List<Tab> tabs = <Tab>[
  Tab(text: 'Login'),
  Tab(text: 'Register'),
  Tab(text: 'Test2')
];

class AppTabsWidget extends StatelessWidget {
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
              Padding(padding: EdgeInsets.all(16.0), child: LoginWidget()),
              Padding(padding: EdgeInsets.all(16.0), child: RegisterWidget()),
              Padding(padding: EdgeInsets.all(16.0), child: TestWidget()),
            ],
          ),
        );
      }),
    );
  }
}
