import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

//Adicionando alerta de sucesso por dispositivo com animação
class ModelAlert {
  androidAlertOk(context, route, flare, animation) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.popAndPushNamed(context, route);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Success'),
      content: Container(
        width: 150,
        height: 150,
        child: FlareActor(
          flare,
          animation: animation,
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

  iOSAlertOk(context, route, flare, animation) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.popAndPushNamed(context, route);
      },
    );

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text('Success'),
      content: Container(
        width: 150,
        height: 150,
        child: FlareActor(
          flare,
          animation: animation,
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
