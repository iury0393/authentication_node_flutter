import 'package:authentication/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class ModelAlert {
  androidAlertOk(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Success'),
      content: Container(
        width: 150,
        height: 150,
        child: FlareActor(
          'assets/Success_Check.flr',
          animation: 'Untitled',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  iOSAlertOk(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
    );

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text('Success'),
      content: Container(
        width: 150,
        height: 150,
        child: FlareActor(
          'assets/Success_Check.flr',
          animation: 'Untitled',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
