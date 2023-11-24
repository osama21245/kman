// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomPlayMiddleSec extends StatelessWidget {
  Color color;
  Size size;
  CustomPlayMiddleSec({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            height: 30,
            thickness: 5,
            color: color,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Text(
              "Football",
              style: TextStyle(
                color: color,
                fontFamily: "Muller",
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: color,
          )
        ],
      ),
    );
  }
}
