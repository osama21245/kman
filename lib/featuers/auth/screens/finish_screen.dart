import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/theme/pallete.dart';

import '../widget/textfield.dart';

class FinishScreen extends ConsumerStatefulWidget {
  const FinishScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinishScreenState();
}

class _FinishScreenState extends ConsumerState<FinishScreen> {
  TextEditingController? password;
  TextEditingController? confirmPassword;
  TextEditingController? fullname;
  TextEditingController? age;

  String gender = "";
  String country = "";
  String city = "";
  @override
  void initState() {
    age = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    fullname = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    age!.dispose();
    password!.dispose();
    confirmPassword!.dispose();
    fullname!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> genderList = [
      'Female',
      'Male',
    ];
    List<String> cityList = [
      'Cairo',
      'Alex',
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          TextFiledAuth(name: "Password", controller: password!),
          TextFiledAuth(name: "Confirm Password", controller: password!),
          TextFiledAuth(name: "Full Name", controller: fullname!),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Pallete.fontColor),
                borderRadius: BorderRadius.circular(size.width * 0.03)),
            child: DropdownButton(
              value: gender,
              focusColor: Colors.transparent,
              items: genderList.map((gen) {
                return DropdownMenuItem(
                  value: gen,
                  child: Text(gen),
                  onTap: () {
                    if (gen == genderList[0]) {
                      gender = genderList[0];
                    } else if (gen == genderList[1]) {
                      gender = genderList[1];
                    }
                    setState(() {});
                  },
                );
              }).toList(),
              onChanged: (value) {
                gender = value!;
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Pallete.fontColor),
                borderRadius: BorderRadius.circular(size.width * 0.03)),
            child: DropdownButton(
              value: city,
              focusColor: Colors.transparent,
              items: cityList.map((cit) {
                return DropdownMenuItem(
                  value: cit,
                  child: Text(cit),
                  onTap: () {
                    if (cit == cityList[0]) {
                      city = cityList[0];
                    } else if (cit == cityList[1]) {
                      city = cityList[1];
                    }
                    setState(() {});
                  },
                );
              }).toList(),
              onChanged: (value) {
                city = value!;
              },
            ),
          )
        ],
      ),
    );
  }
}
