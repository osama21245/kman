// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/play/widget/play/showrating.dart';

import 'package:kman/theme/pallete.dart';

class CustomCoachesGymsCard extends ConsumerWidget {
  String name;
  String category;
  double rating;
  CustomCoachesGymsCard({
    required this.name,
    required this.category,
    required this.rating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 3,
          child: Column(
            children: [
              Container(
                height: size.height * 0.05,
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontFamily: "Muller",
                              color: Pallete.whiteColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(child: Container(color: Pallete.whiteColor)),
                    Container(
                      width: size.width * 0.1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                              fontFamily: "Muller",
                              color: Pallete.fontColor,
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            child: Column(
          children: [
            CircleAvatar(
                backgroundImage:
                    AssetImage("assets/page-1/images/coaches-gyms.png")),
            Text(
              "Coach",
              style: TextStyle(
                fontFamily: "Muller",
                color: Pallete.whiteColor,
                fontSize: size.width * 0.03,
              ),
            ),
            Text(
              "$name",
              style: TextStyle(
                  fontFamily: "Muller",
                  color: Pallete.whiteColor,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "$category",
              style: TextStyle(
                fontFamily: "Muller",
                color: Pallete.whiteColor,
                fontSize: size.width * 0.03,
              ),
            ),
            RatingDisplayWidget(
                rating: rating, color: Pallete.ratingColor, size: size)
          ],
        ))
      ],
    );
  }
}
