import 'package:diabetic_maternal_care/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

OutlineInputBorder authFormFieldDeco(BuildContext context) =>
    OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Theme.of(context).primaryColor));

Widget createAppBar(
  BuildContext context,
  String title, [
  List<Widget> actions,
  bool hideHomeBtn = false,
]) =>
    AppBar(
      title: Text(title),
      actions: [
        ...actions ?? [],
        if (title.isNotEmpty && !hideHomeBtn)
          IconButton(
            icon: new Image.asset(
              'assets/images/logo.png',
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
      ],
    );
