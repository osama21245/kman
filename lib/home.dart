import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/home.dart';
import 'package:kman/featuers/play/screens/categories_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: homeSectionsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (homeSectionsList[index].section == "play") {
                Get.to(CategoriesScreen());
              }
            },
            child: ListTile(
              title: Text(homeSectionsList[index].section),
            ),
          );
        },
      )),
    );
  }
}
