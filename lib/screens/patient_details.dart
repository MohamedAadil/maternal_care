import 'package:diabetic_maternal_care/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, 'Patient Details'),
      body: Column(),
    );
  }
}
