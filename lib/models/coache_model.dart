// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class CoacheModel {
  final String id;
  final String name;
  final int rating;
  final String photo;
  final String education;
  final String whatsAppNum;
  final String categoriry;
  final String experience;
  final int price;
  final String benefits;
  final List<String> cvs;
  CoacheModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.photo,
    required this.education,
    required this.whatsAppNum,
    required this.categoriry,
    required this.experience,
    required this.price,
    required this.benefits,
    required this.cvs,
  });

  CoacheModel copyWith({
    String? id,
    String? name,
    int? rating,
    String? photo,
    String? education,
    String? whatsAppNum,
    String? categoriry,
    String? experience,
    int? price,
    String? benefits,
    List<String>? cvs,
  }) {
    return CoacheModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      photo: photo ?? this.photo,
      education: education ?? this.education,
      whatsAppNum: whatsAppNum ?? this.whatsAppNum,
      categoriry: categoriry ?? this.categoriry,
      experience: experience ?? this.experience,
      price: price ?? this.price,
      benefits: benefits ?? this.benefits,
      cvs: cvs ?? this.cvs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rating': rating,
      'photo': photo,
      'education': education,
      'whatsAppNum': whatsAppNum,
      'categoriry': categoriry,
      'experience': experience,
      'price': price,
      'benefits': benefits,
      'cvs': cvs,
    };
  }

  factory CoacheModel.fromMap(Map<String, dynamic> map) {
    return CoacheModel(
      id: map['id'] as String,
      name: map['name'] as String,
      rating: map['rating'] as int,
      photo: map['photo'] as String,
      education: map['education'] as String,
      whatsAppNum: map['whatsAppNum'] as String,
      categoriry: map['categoriry'] as String,
      experience: map['experience'] as String,
      price: map['price'] as int,
      benefits: map['benefits'] as String,
      cvs: List<String>.from((map['cvs'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoacheModel.fromJson(String source) =>
      CoacheModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoacheModel(id: $id, name: $name, rating: $rating, photo: $photo, education: $education, whatsAppNum: $whatsAppNum, categoriry: $categoriry, experience: $experience, price: $price, benefits: $benefits, cvs: $cvs)';
  }

  @override
  bool operator ==(covariant CoacheModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.photo == photo &&
        other.education == education &&
        other.whatsAppNum == whatsAppNum &&
        other.categoriry == categoriry &&
        other.experience == experience &&
        other.price == price &&
        other.benefits == benefits &&
        listEquals(other.cvs, cvs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        photo.hashCode ^
        education.hashCode ^
        whatsAppNum.hashCode ^
        categoriry.hashCode ^
        experience.hashCode ^
        price.hashCode ^
        benefits.hashCode ^
        cvs.hashCode;
  }
}
