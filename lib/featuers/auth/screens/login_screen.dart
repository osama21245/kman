import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../theme/pallete.dart';
import '../widget/textfield.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController? email;
  TextEditingController? password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }

  signInWithEmailAndPassword(WidgetRef ref) {
    ref
        .watch(authControllerProvider.notifier)
        .signInWithEmailAndPassword(email!.text, password!.text, context);
  }

  signInWithGoogle(WidgetRef ref) {
    ref.watch(authControllerProvider.notifier).signinWithGoogle(context, true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/page-1/images/logo-nobackground.png"),
          Text(
            'Welcome Back , Log in !',
            style: TextStyle(
                color: Pallete.fontColor,
                fontFamily: "Muller",
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
          TextFiledAuth(name: "Email or Phone Number", controller: email!),
          TextFiledAuth(name: "Password", controller: password!),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot your password?',
                style: TextStyle(
                    color: Pallete.blackColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.02,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => signInWithEmailAndPassword(ref),
            child: Text(
              'Log in',
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
                "Don't Have an account?",
                style: TextStyle(
                    color: Pallete.fontColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "Register Now",
                style: TextStyle(
                    color: Pallete.fontColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "Or log in with",
            style: TextStyle(
                color: Pallete.blackColor,
                fontFamily: "Muller",
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.w500),
          ),
          SignInButton(
            Buttons.facebook,
            mini: true,
            onPressed: () {},
          ),
          SignInButton(
            Buttons.google,
            mini: true,
            onPressed: () => signInWithGoogle(ref),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "By using KAMN you agree to our",
                    style: TextStyle(
                        color: Pallete.blackColor,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Terms of Service",
                    style: TextStyle(
                        color: Pallete.blackColor,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "and",
                    style: TextStyle(
                        color: Pallete.blackColor,
                        fontFamily: "Muller",
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Pallete.blackColor,
                    fontFamily: "Muller",
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      )),
    );
  }
}
