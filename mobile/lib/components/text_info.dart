import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({this.text, this.fontWeight, this.fontSize});

  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
