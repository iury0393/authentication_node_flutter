import 'package:authentication/components/action_button.dart';
import 'package:authentication/components/model_alert.dart';
import 'package:authentication/components/text_info.dart';
import 'package:authentication/models/Token.dart';
import 'package:authentication/screens/main_screen.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:authentication/services/auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io' show Platform;

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Token token;
  AuthModel _authModel = AuthModel();
  ModelAlert _modelAlert = ModelAlert();
  String email;
  String password;
  bool passwordVisible = true;
  bool showSpinner = false;
  String username;

  void _signInUser(email, password) async {
    setState(() {
      showSpinner = true;
    });
    try {
      var userData = await _authModel.signInUser(email, password);
      token = Token.fromJson(userData);

      if (token.token != null) {
        print(token.user.email);

        Platform.isIOS
            ? _modelAlert.iOSAlertOk(
                context,
                MainScreen.id,
                'assets/Success_Check.flr',
                'Untitled',
              )
            : _modelAlert.androidAlertOk(
                context,
                MainScreen.id,
                'assets/Success_Check.flr',
                'Untitled',
              );
        setState(() {
          showSpinner = false;
        });
      } else {
        Platform.isIOS
            ? _modelAlert.iOSAlertOk(
                context,
                MainScreen.id,
                'assets/Fail.flr',
                'pop',
              )
            : _modelAlert.androidAlertOk(
                context,
                MainScreen.id,
                'assets/Fail.flr',
                'pop',
              );
        setState(() {
          showSpinner = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FlareActor(
                'assets/sign_in_bg_animation.flr',
                animation: 'Flow',
                fit: BoxFit.cover,
                antialias: false,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
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
                    text: 'Entre por aqui.',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 30,
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ActionButton(
                          btnIcon: Icons.fingerprint,
                          btnFnc: () {},
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ActionButton(
                          btnIcon: FeatherIcons.logIn,
                          btnFnc: () {
                            _signInUser(email, password);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Center(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: TextInfo(
                          text: 'Crie uma conta',
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
