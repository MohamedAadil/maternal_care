import 'package:diabetic_maternal_care/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, 'Doctor Details'),
      body: Column(),
    );
  }
}
