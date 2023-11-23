import 'package:flutter/material.dart';
import 'package:kman/theme/pallete.dart';

class CustomGridentBackground extends StatelessWidget {
  Widget child;
  List<Color> colors;
  CustomGridentBackground({Key? key, required this.child, required this.colors})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xfffafafa),
          gradient: LinearGradient(
            begin: Alignment(0, -1.058),
            end: Alignment(0, 0.942),
            colors: colors,
            stops: <double>[0, 1],
          ),
        ),
        child: child,
      ),
    );
  }
}
