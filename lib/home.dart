import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kman/core/class/home.dart';
import 'package:kman/featuers/play/screens/categories_screen.dart';
import 'package:kman/featuers/play/widget/home/custom_home_card.dart';
import 'package:kman/theme/pallete.dart';

import 'featuers/play/widget/home/custom_home_uppersection.dart';
import 'utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        CustomHomeUpperSec(
          size: size,
        ),
        Divider(
          thickness: 3,
          color: Color(0xff272361),
        ),
        Padding(
          padding: EdgeInsets.all(size.height * 0.015),
          child: Text(
            "K.A.M.N",
            style: TextStyle(
                fontFamily: "Muller",
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.08,
                color: Color(0xff272361)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: homeSectionsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: size.width * 0.03),
                child: CustomHomeCard(
                    size: size,
                    image: homeSectionsList[index].image,
                    section: homeSectionsList[index].section),
              );
            },
          ),
        ),
      ],
    ));
  }
}
