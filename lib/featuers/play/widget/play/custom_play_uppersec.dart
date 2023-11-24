import 'package:flutter/material.dart';

class CustomPlayUpperSec extends StatelessWidget {
  Size size;
  Color color;
  CustomPlayUpperSec({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.width * 0.08,
          right: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: size.width * 0.045,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            backgroundColor: color,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'PLAY',
              style: TextStyle(
                color: color,
                fontFamily: "Muller",
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.09,
          )
        ],
      ),
    );
  }
}
