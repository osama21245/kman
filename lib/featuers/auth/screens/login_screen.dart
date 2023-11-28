import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/auth/controller/auth_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
