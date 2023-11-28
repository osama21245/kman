// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/models/grounds_model.dart';

import '../../../../theme/pallete.dart';
import '../../controller/play_controller.dart';

class CustomGroundBody extends ConsumerWidget {
  GroundModel groundModel;
  Size size;
  Color color;
  CustomGroundBody(
      {Key? key,
      required this.groundModel,
      required this.size,
      required this.color})
      : super(key: key);

  void gpsTracking(WidgetRef ref, BuildContext context) {
    ref
        .watch(playControllerProvider.notifier)
        .gpsTracking(groundModel.long, groundModel.lat, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset("assets/page-1/images/adidas.png"),
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Playground Features",
              style: TextStyle(
                  color: color,
                  fontSize: size.width * 0.034,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          "${groundModel.futuers}",
          style: TextStyle(
              color: Pallete.fontColor,
              fontSize: size.width * 0.034,
              fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${groundModel.price} EGP/Hr",
              style: TextStyle(
                  fontFamily: "Muller",
                  color: Pallete.fontColor,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => gpsTracking(ref, context),
                child: Text("GPS", style: TextStyle(color: color)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.02))),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Ground Shule",
                  style: TextStyle(color: color),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Pallete.whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(size.width * 0.02))),
              ),
            )
          ],
        )
      ],
    );
  }
}
