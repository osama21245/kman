import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';

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
      body: OtpTextField(
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
    );
  }
}
