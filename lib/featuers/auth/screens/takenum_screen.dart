import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/pallete.dart';

class TakeNumScren extends ConsumerWidget {
  const TakeNumScren({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/page-1/images/verification.png"),
          Text(
            "Verify Your Number",
            style: TextStyle(
                color: Pallete.fontColor,
                fontFamily: "Muller",
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Please enter you country \n Your phone number",
            style: TextStyle(
                color: Pallete.fontColor,
                fontFamily: "Muller",
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Container(
                color: Pallete.greyColor,
                child: Icon(Icons.arrow_drop_down_rounded),
              ),
              Expanded(
                  child: Container(
                color: Pallete.greyColor,
              ))
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'SEND',
              style: TextStyle(
                  color: Pallete.whiteColor,
                  fontFamily: "Muller",
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.width * 0.02))),
          ),
          Image.asset("assets/page-1/images/step2.png")
        ],
      ),
    );
  }
}
