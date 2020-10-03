import 'package:flutter/material.dart';

class HomeDashboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aircrest")),
      body: Column(
        children: [Text("I'm home")],
      ),
    );
  }
}
