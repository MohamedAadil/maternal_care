import 'package:flutter/cupertino.dart';

class HomeScreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(Rect.fromPoints(Offset(0, 0), Offset(60, 60)))
      ..addOval(Rect.fromPoints(Offset(100, 100), Offset(60, 60)))
      ..addOval(Rect.fromLTWH(0, size.height - 100, 100, 100))
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 20))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
