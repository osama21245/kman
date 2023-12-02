import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';

import '../../../theme/pallete.dart';

class VerficationScreen extends ConsumerStatefulWidget {
  String phone;
  VerficationScreen({super.key, required this.phone});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerficationScreenState();
}

class _VerficationScreenState extends ConsumerState<VerficationScreen> {
  getSms(WidgetRef ref) {
    ref
        .watch(authControllerProvider.notifier)
        .verifyPhone(context, widget.phone);
  }

  getCode(WidgetRef ref, String code) {
    ref.watch(authControllerProvider.notifier).sendCode(code, context);
  }

  @override
  void initState() {
    getSms(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/page-1/images/icon-1-1.png"),
          OtpTextField(
            borderWidth: 3,
            fieldWidth: size.width * 0.14,
            numberOfFields: 5,
            borderColor: const Color.fromARGB(255, 0, 0, 0),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {},
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              getCode(ref, verificationCode);
            }, // end onSubmit
          ),
          Text(
            "Enter OTP",
            style: TextStyle(
                color: Pallete.fontColor,
                fontFamily: "Muller",
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Please enter 5-Digital code \n we've sent to your phone number",
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
              'VERIFY',
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
          Row(
            children: [
              Text(
                "Don't receive a code?",
                style: TextStyle(
                    color: Pallete.fontColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "Resend Now",
                style: TextStyle(
                    color: Pallete.fontColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset("assets/page-1/images/step2.png")
        ],
      ),
    );
  }
}
