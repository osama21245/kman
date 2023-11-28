// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kman/models/grounds_model.dart';

import '../../../../theme/pallete.dart';

class CustomGroundBody extends StatelessWidget {
  GroundModel groundModel;
  Size size;
  Color color;
  CustomGroundBody(
      {Key? key,
      required this.groundModel,
      required this.size,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("${groundModel.groundImage}"),
        Row(
          children: [
            Image.asset(
              "assets/page-1/images/blueLocation.png",
              width: size.width * 0.04,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "${groundModel.address}",
              style: TextStyle(
                color: Pallete.fontColor,
                fontSize: size.width * 0.04,
              ),
            )
          ],
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Row(
          children: [
            Image.asset(
              "assets/page-1/images/ph-phone.png",
              width: size.width * 0.04,
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "${groundModel.groundnumber}",
              style: TextStyle(
                color: Pallete.fontColor,
                fontSize: size.width * 0.04,
              ),
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Text(
              "Playground Features",
              style: TextStyle(
                  color: color,
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(
              "${groundModel.groundnumber}",
              style: TextStyle(
                  color: Pallete.fontColor,
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
