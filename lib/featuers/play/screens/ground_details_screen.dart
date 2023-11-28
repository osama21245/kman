import 'package:flutter/material.dart';
import 'package:kman/featuers/play/widget/ground_details/custom_ground_middlesec.dart';
import 'package:kman/featuers/play/widget/play/custom_play_grident.dart';
import 'package:kman/models/grounds_model.dart';

import '../../../core/common/custom_uppersec.dart';

class GroundDetailsScreen extends StatelessWidget {
  Color? color;
  Size? size;
  List<Color>? backgroundColor;
  String? collection;
  GroundModel? groundModel;
  GroundDetailsScreen(
      {Key? key,
      this.color,
      this.size,
      this.backgroundColor,
      this.collection,
      this.groundModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGridentBackground(
        colors: backgroundColor!,
        child: Column(
          children: [
            CustomUpperSec(color: color!, size: size!),
            SizedBox(
              height: size!.height * 0.02,
            ),
            Divider(
              thickness: 3,
              color: Colors.black,
            ),
            CustomGroundMiddleSec(
                color: color!,
                size: size!,
                collection: collection!,
                title: groundModel!.name,
                rating: groundModel!.rating)
          ],
        ),
      ),
    );
  }
}
