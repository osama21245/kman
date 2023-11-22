import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kman/models/coache_model.dart';
import 'package:kman/models/gym_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../core/providers/utils.dart';
import '../repositories/coaches-gyms_repository.dart';

final getCoachesProvider = FutureProvider(
    (ref) => ref.watch(coachesGymsControllerProvider.notifier).getGrounds());

final getGymsProvider = FutureProvider(
    (ref) => ref.watch(coachesGymsControllerProvider.notifier).getGyms());

final coachesGymsControllerProvider = StateNotifierProvider((ref) =>
    CoachesGymsController(
        storageRepository: ref.watch(storageRepositoryProvider),
        coachesGymsRepository: ref.watch(CoachesGymsRepositoryProvider),
        ref: ref));

class CoachesGymsController extends StateNotifier<bool> {
  final Ref _ref;
  final CoachesGymsRepository _coachesGymsRepository;
  final StorageRepository _storageRepository;

  CoachesGymsController(
      {required CoachesGymsRepository coachesGymsRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _coachesGymsRepository = coachesGymsRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  Future<List<CoacheModel>> getGrounds() {
    return _coachesGymsRepository.getCoaches();
  }

  Future<List<GymModel>> getGyms() {
    return _coachesGymsRepository.getGyms();
  }

  //**************************futuers only for ground owner*******************************************

  void setGyms(int price, String name, String benefits, String link,
      File fileLogo, BuildContext context, bool ismix) async {
    String id = Uuid().v1();
    String address;
    Position position;
    String logo = "";
    // get user loction
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
    ].request();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    address = "${placemark.administrativeArea}, ${placemark.country}";

    //get image

    final res = await _storageRepository.storeFile(
        path: "Gyms", id: id, file: fileLogo);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      logo = r;
    });
//set data
    if (logo != "") {
      GymModel gymModel = GymModel(
          id: id,
          name: name,
          benefits: benefits,
          link: link,
          logo: logo,
          address: address,
          long: position.longitude,
          lat: position.latitude,
          ismix: ismix,
          price: price);

      final res = await _coachesGymsRepository.setGym(gymModel);
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your Gym Added Succefuly", context));
    }
  }

  void setCoache(
      String name,
      BuildContext context,
      String education,
      String whatsAppNum,
      String categoriry,
      String experience,
      File fileCoacheImage,
      int price,
      List<String> cvs,
      String benefits) async {
    String id = Uuid().v1();
    String photo = "";
    //get image

    final res = await _storageRepository.storeFile(
        path: "Gyms", id: id, file: fileCoacheImage);

    res.fold((l) => showSnackBar(l.toString(), context), (r) {
      photo = r;
    });

    if (photo != "") {
      CoacheModel coacheModel = CoacheModel(
          id: id,
          name: name,
          rating: 5,
          photo: photo,
          education: education,
          whatsAppNum: whatsAppNum,
          categoriry: categoriry,
          experience: experience,
          price: price,
          benefits: benefits,
          cvs: cvs);

      final res = await _coachesGymsRepository.setCoache(coacheModel);
      res.fold((l) => showSnackBar(l.toString(), context),
          (r) => showSnackBar("Your reserve Added Succefuly", context));
    }
  }
}
