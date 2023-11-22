import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/categories.dart';
import 'package:kman/featuers/play/screens/play_home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(PlayHomeScreen(
                collection: categoriesList[index].name,
              ));
            },
            child: ListTile(
              title: Text(categoriesList[index].name),
            ),
          );
        },
      ),
    );
  }
}
