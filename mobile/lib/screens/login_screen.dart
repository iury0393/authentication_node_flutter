import 'package:authentication/components/action_button.dart';
import 'package:authentication/components/text_info.dart';
import 'package:authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                    btnFnc: () => {},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ActionButton(
                    btnIcon: FeatherIcons.logIn,
                    btnFnc: () => {},
                  ),
                ),
              ],
            ),
            Container(
              child: Center(
                child: FlatButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, RegisterScreen.id),
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
    );
  }
}
