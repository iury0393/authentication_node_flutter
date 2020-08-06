import 'package:authentication/components/action_button.dart';
import 'package:authentication/components/model_alert.dart';
import 'package:authentication/components/text_info.dart';
import 'package:authentication/services/auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'dart:io' show Platform;

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthModel authModel = AuthModel();
  ModelAlert modelAlert = ModelAlert();
  String email;
  String password;
  String name;
  bool passwordVisible = true;

  //Chamada para fazer o registro
  void signUpUser(name, email, password) async {
    try {
      var userData = await authModel.signUpUser(name, email, password);

      print(userData);

      Platform.isIOS
          ? modelAlert.iOSAlertOk(context)
          : modelAlert.androidAlertOk(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: FlareActor(
                'assets/Flow_background.flr',
                animation: 'Flow',
                fit: BoxFit.cover,
                antialias: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 250,
                  ),
                  TextInfo(
                    text: 'Bem-vindo ao',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                  TextInfo(
                    text: 'FlAuth',
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                  TextInfo(
                    text: 'Projeto para treino de autenticação com Flutter.',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextInfo(
                    text: 'Registre-se por aqui.',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Digite seu nome',
                      prefixIcon: Icon(FeatherIcons.user),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Digite seu email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    obscureText: passwordVisible,
                    onChanged: (value) {
                      password = value;
                    },
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Digite sua senha',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ActionButton(
                      btnIcon: FeatherIcons.check,
                      btnFnc: () {
                        signUpUser(name, email, password);
                      },
                    ),
                  ),
                  Container(
                    child: Center(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextInfo(
                          text: 'Volte ao login',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
