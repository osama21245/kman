import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/class/statusrequest.dart';

import '../../../core/utils.dart';
import '../../../models/user_model.dart';
import '../repositories/auth_repository.dart';

final authStateCahngeProvider = StreamProvider((ref) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authcontroller = ref.watch(authControllerProvider.notifier);
  return authcontroller.getUserData(uid);
});

StateProvider<UserModel?> usersProvider =
    StateProvider<UserModel?>((ref) => null);

StateNotifierProvider<AuthController, StatusRequest> authControllerProvider =
    StateNotifierProvider<AuthController, StatusRequest>((ref) =>
        AuthController(
            authRepository: ref.watch(AuthRepositoryProvider), ref: ref));

class AuthController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(StatusRequest.success);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  signinWithGoogle(BuildContext context, bool isFromLogin) async {
    state = StatusRequest.loading;
    final user = await _authRepository.signinWithGoogle(isFromLogin);
    state = StatusRequest.success;

    user.fold((l) => showSnackBar(l.message, context), (userModel) async {
      _ref.read(usersProvider.notifier).update((state) => userModel);
    });
  }

  void signInAsGuest(BuildContext context) async {
    state = StatusRequest.loading;
    final user = await _authRepository.signInAsGuest();
    state = StatusRequest.success;

    user.fold((l) => showSnackBar(l.message, context), (userModel) async {
      _ref.read(usersProvider.notifier).update((state) => userModel);
    });
  }

  void createAccountWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    state = StatusRequest.loading;

    final res = await _authRepository.createAccountWithEmailAndPassword(
        email, password);
    state = StatusRequest.success;

    res.fold((l) => showSnackBar(l.message, context),
        (r) => showSnackBar("Your email created succefuly", context));
  }

  void signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    state = StatusRequest.loading;
    final res =
        await _authRepository.signInWithEmailAndPassword(email, password);
    state = StatusRequest.success;

    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void setUserData(UserModel userModel, BuildContext context) async {
    state = StatusRequest.loading;
    final res = await _authRepository.setUserData(userModel);
    state = StatusRequest.success;
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void verifyPhone(BuildContext context, String phone) async {
    final res = await _authRepository.verifyPhone(phone);

    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void sendCode(String code, BuildContext context) async {
    final res = await _authRepository.sendCode(code);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }

  void logOut() async {
    _authRepository.logOut();
  }

  void updateUserStatus(bool isonline, BuildContext context) async {
    final uid = _ref.read(usersProvider)!.uid;
    final res = await _authRepository.updateUserState(uid, isonline);
    res.fold((l) => showSnackBar(l.message, context), (r) => null);
  }
}
