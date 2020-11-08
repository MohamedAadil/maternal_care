import 'package:diabetic_maternal_care/main.dart';
import 'package:diabetic_maternal_care/screens/calorie_counter.dart';
import 'package:diabetic_maternal_care/screens/doctor_details.dart';
import 'package:diabetic_maternal_care/screens/patient_details.dart';
import 'package:diabetic_maternal_care/screens/upload_reports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createCard(dynamic data, BuildContext context) => Padding(
      padding: EdgeInsets.all(5.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            switch (data['key']) {
              case 'patient_details':
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PatientDetails()));
                  break;
                }
              case 'doctor_details':
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DoctorDetails()));
                  break;
                }
              case 'calorie_counter':
                {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CalorieCounter()));
                  break;
                }
              case 'report':
                {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UploadReports()));
                  break;
                }
            }
          },
          child: Container(
            width: 150.0,
            height: 150.0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    data['img'],
                    width: 70.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        elevation: 4.0,
      ),
    );
