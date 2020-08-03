import 'package:flutter/material.dart';

import '../constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({this.btnIcon, this.btnFnc});

  final IconData btnIcon;
  final Function btnFnc;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        icon: Icon(btnIcon),
        onPressed: btnFnc,
      ),
    );
  }
}
