import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  String email;
  String password;

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
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'E-mail'),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Digite uma senha'),
            ),
          ],
        ),
      ),
    );
  }
}
