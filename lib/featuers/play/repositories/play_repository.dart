import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/core/faliure.dart';
import 'package:kman/core/providers/firebase_providers.dart';
import 'package:kman/core/type_def.dart';
import 'package:kman/models/grounds_model.dart';
import 'package:kman/models/reserved_model.dart';

final PlayRepositoryProvider =
    Provider((ref) => PlayRepository(firestore: ref.watch(FirestoreProvider)));

class PlayRepository {
  final FirebaseFirestore _firestore;

  PlayRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _football => _firestore.collection("football");
  CollectionReference get _users => _firestore.collection("users");

  FutureVoid reserve(
      String groundId, String collection, ReserveModel reserveModel) async {
    try {
      await _firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"isresrved": true});

      return right(_users
          .doc("uid")
          .collection("reserve")
          .doc(reserveModel.id)
          .set(reserveModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid askForPlayes(String groundId, String collection,
      ReserveModel reserveModel, int targetplayesNum) async {
    try {
      await _firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"iscomplete": false, "targetplayesNum": targetplayesNum});

      return right(_users
          .doc("uid")
          .collection("reserve")
          .doc(reserveModel.id)
          .update({"iscomplete": false, "targetplayesNum": targetplayesNum}));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<GroundModel>> getGrounds(String collection) {
    return _firestore.collection(collection).snapshots().map((event) {
      List<GroundModel> grounds = [];
      for (var document in event.docs) {
        grounds
            .add(GroundModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return grounds;
    });
  }

  Stream<List<ReserveModel>> getReservisions(
      String collection, String groundId, String day) {
    return _firestore
        .collection(collection)
        .doc(groundId)
        .collection("reserve")
        .where("day", isEqualTo: day)
        .where("isresrved", isNotEqualTo: true)
        .snapshots()
        .map((event) {
      List<ReserveModel> grounds = [];
      for (var document in event.docs) {
        grounds
            .add(ReserveModel.fromMap(document.data() as Map<String, dynamic>));
      }
      return grounds;
    });
  }

  //***************futures only for groun owner*******************
  FutureVoid setGround(GroundModel groundModel, String collection) async {
    try {
      return right(_firestore
          .collection(collection)
          .doc(groundModel.id)
          .set(groundModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid setreservision(
      String groundId, String collection, ReserveModel reserveModel) async {
    try {
      return right(_firestore
          .collection(collection)
          .doc(groundId)
          .collection("reserve")
          .doc(reserveModel.id)
          .set(reserveModel.toMap()));
    } on FirebaseException catch (e) {
      throw e.toString();
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
