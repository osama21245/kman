import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishScreen extends ConsumerStatefulWidget {
  const FinishScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinishScreenState();
}

class _FinishScreenState extends ConsumerState<FinishScreen> {
  TextEditingController? password;
  TextEditingController? confirmPassword;
  TextEditingController? fullname;
  String gender = "";
  String age = "";
  String country = "";
  String city = "";
  @override
  void initState() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    fullname = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password!.dispose();
    confirmPassword!.dispose();
    fullname!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
