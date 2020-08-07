import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainScreen extends StatelessWidget {
  static const String id = '/main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlAuth'),
        leading: IconButton(
            icon: Icon(FeatherIcons.logOut),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
