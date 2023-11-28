import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kman/core/constants/firebase_constants.dart';
import 'package:kman/core/providers/firebase_providers.dart';

import '../../../core/constants/constants.dart';
import '../../../core/faliure.dart';
import '../../../core/type_def.dart';
import '../../../models/user_model.dart';

final AuthRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.watch(FirestoreProvider),
    auth: ref.watch(AuthProvider),
    googleSignIn: ref.watch(GoogleProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _googleSignIn = googleSignIn,
        _auth = auth;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  String verifyid = "";
  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signinWithGoogle(bool isFromLogin) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: (googleAuth).accessToken, idToken: (googleAuth).idToken);
      UserCredential userCredential;

      if (isFromLogin) {
        userCredential = await _auth.signInWithCredential(credential);
      } else {
        userCredential =
            await _auth.currentUser!.linkWithCredential(credential);
      }

      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            isactive: true,
            ingroup: [],
            isonline: false,
            name: userCredential.user!.displayName ?? "No Name",
            profilePic:
                userCredential.user!.photoURL ?? Constants.avatarDefault,
            phone: userCredential.user!.phoneNumber!,
            age: "Enter Your Age",
            uid: userCredential.user!.uid,
            isAuthanticated: true,
            points: 0,
            followers: [],
            city: "Set Your City",
            country: "Set Your City",
            myGrounds: [],
            state: "0",
            gender: "male",
            awards: ['gold']);
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> signInAsGuest() async {
    try {
      var userCredential = await _auth.signInAnonymously();

      UserModel userModel = UserModel(
          isactive: true,
          followers: [],
          name: 'Guest',
          profilePic: Constants.avatarDefault,
          uid: userCredential.user!.uid,
          isAuthanticated: false,
          points: 0,
          phone: userCredential.user!.phoneNumber!,
          age: "Enter Your Age",
          awards: [],
          city: "Set Your City",
          country: "Set Your City",
          myGrounds: [],
          state: "0",
          gender: "male",
          isonline: false,
          ingroup: []);

      await _users.doc(userCredential.user!.uid).set(userModel.toMap());

      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid verifyPhone(String phone) async {
    try {
      return right(FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+20$phone',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          //here use a Getx to show snackbar because i dont want to add context here to make this section testable for unit testing
          Get.snackbar("!", "Code is not correct");
        },
        codeSent: (String verificationId, int? resendToken) {
          verifyid = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      ));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid createAccountWithEmailAndPassword(
      String email, String password) async {
    try {
      return right(_auth.createUserWithEmailAndPassword(
          email: email, password: password));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid signInWithEmailAndPassword(String email, String password) async {
    try {
      return right(
          _auth.signInWithEmailAndPassword(email: email, password: password));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setUserData(UserModel userModel) async {
    try {
      return right(_users.doc(userModel.uid).set(userModel.toMap()));
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid sendCode(String code) async {
    try {
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyid, smsCode: code);
      return right(credential);
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  FutureVoid updateUserState(String uid, bool isonline) async {
    try {
      if (isonline == true) {
        return right(_users.doc(uid).update({"isonline": isonline}));
      } else {
        return right(_users.doc(uid).update({"isonline": isonline}));
      }
    } on FirebaseException catch (e) {
      throw e;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
