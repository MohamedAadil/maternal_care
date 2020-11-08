import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_loader.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool invert;
  final bool isLoading;

  AppButton(
      {@required this.onPressed,
      @required this.text,
      this.invert = false,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: MaterialButton(
        color: invert ? Colors.white : Theme.of(context).primaryColor,
        onPressed: onPressed,
        disabledColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: isLoading
            ? CustomLoader(
                customColor: !invert ? Colors.white : null,
              )
            : Text(
                text,
                style: TextStyle(color: invert ? Colors.black : Colors.white),
              ),
        minWidth: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.08,
      ),
    );
  }
}
