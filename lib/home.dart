import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kman/core/class/home.dart';
import 'package:kman/featuers/play/screens/categories_screen.dart';
import 'package:kman/featuers/play/widget/home/custom_home_card.dart';
import 'package:kman/featuers/play/widget/home/custombuttomAppbarHome.dart';
import 'package:kman/theme/pallete.dart';

import 'featuers/play/widget/home/custom_home_uppersection.dart';
import 'utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBarHome(
        color: Pallete.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Pallete.primaryColor,
        onPressed: () {
          Get.offAll(() => Home());
        },
        child: const Icon(Icons.shopping_basket_outlined),
      ),
      body: SafeArea(
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "K.A.M.N",
              style: TextStyle(
                  fontFamily: "Muller",
                  fontWeight: FontWeight.w700,
                  fontSize: size.width * 0.1,
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
      )),
    );
  }
}
