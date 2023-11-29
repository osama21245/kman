import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/booking_screen.dart';
import 'package:kman/featuers/play/widget/ground_details/custom_ground_middlesec.dart';
import 'package:kman/featuers/play/widget/play/custom_play_grident.dart';
import 'package:kman/models/grounds_model.dart';

import '../../../core/common/custom_uppersec.dart';
import '../widget/ground_details/custom_ground_body.dart';

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
      floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(BookingScreen(
                collection: collection,
                groundId: groundModel!.id,
                color: color,
                playersMaxNum: groundModel!.groundPlayersNum,
              ))),
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
                rating: groundModel!.rating),
            CustomGroundBody(
                color: color!, groundModel: groundModel!, size: size!)
          ],
        ),
      ),
    );
  }
}
