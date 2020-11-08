import 'package:flutter/cupertino.dart';

String formValidator(String val, String fieldType, BuildContext context,
    [bool isMandatory = true]) {
  final emptyText = 'Cannot be empty';
  final validUserName = 'Enter valid user name';
  if (val.trim().isEmpty && isMandatory) {
    return emptyText;
  }

  /* if (fieldType == 'email' && val.isNotEmpty) {
    final isEmailValid = _emailValidator(val);
    if (!isEmailValid) {
      return Text('');
    }
  } */

  return null;
}
