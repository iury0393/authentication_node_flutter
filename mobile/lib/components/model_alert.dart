import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

//Adicionando alerta de sucesso por dispositivo com animação
class ModelAlert {
  androidAlertOk(context, route) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, route);
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

  iOSAlertOk(context, route) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, route);
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
