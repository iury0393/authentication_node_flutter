import 'package:authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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
          children: <Widget>[
            Text(
              'Bem-vindo ao',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              'FlAuth',
              style: GoogleFonts.roboto(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              'Projeto para treino de autenticação com Flutter.\n Entre por aqui.',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
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
            Row(
              children: <Widget>[
                Container(
                  height: 42.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kButtonColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: IconButton(
                    color: kButtonColor,
                    icon: Icon(Icons.fingerprint),
                    onPressed: () => {},
                  ),
                ),
                Container(
                  height: 42.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kButtonColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: IconButton(
                    color: kButtonColor,
                    icon: Icon(FeatherIcons.logIn),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushNamed(context, RegisterScreen.id),
              },
              child: Text(
                'Crie uma conta',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
