import 'package:authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  String name;
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
              'Projeto para treino de autenticação com Flutter.\n Se registre aqui.',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
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
                icon: Icon(FeatherIcons.check),
                onPressed: () => {},
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushNamed(context, LoginScreen.id),
              },
              child: Text(
                'Volte ao login',
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
