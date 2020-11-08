import 'package:diabetic_maternal_care/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalorieCounter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, 'Calorie Counter'),
      body: Column(),
    );
  }
}
