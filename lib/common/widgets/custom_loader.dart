import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final Color customColor;

  CustomLoader({this.customColor});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
          customColor ?? Theme.of(context).primaryColor),
    );
  }
}
