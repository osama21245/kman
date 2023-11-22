// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class MedicalModel {
  final String? id;
  final String? name;
  final int rating;
  final String education;
  final String experience;
  final String benefits;
  final String whatAppNum;
  final int discount;
  MedicalModel({
    this.id,
    this.name,
    required this.rating,
    required this.education,
    required this.experience,
    required this.benefits,
    required this.whatAppNum,
    required this.discount,
  });

  MedicalModel copyWith({
    String? id,
    String? name,
    int? rating,
    String? education,
    String? experience,
    String? benefits,
    String? whatAppNum,
    int? discount,
  }) {
    return MedicalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      benefits: benefits ?? this.benefits,
      whatAppNum: whatAppNum ?? this.whatAppNum,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rating': rating,
      'education': education,
      'experience': experience,
      'benefits': benefits,
      'whatAppNum': whatAppNum,
      'discount': discount,
    };
  }

  factory MedicalModel.fromMap(Map<String, dynamic> map) {
    return MedicalModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      rating: map['rating'] as int,
      education: map['education'] as String,
      experience: map['experience'] as String,
      benefits: map['benefits'] as String,
      whatAppNum: map['whatAppNum'] as String,
      discount: map['discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalModel.fromJson(String source) =>
      MedicalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedicalModel(id: $id, name: $name, rating: $rating, education: $education, experience: $experience, benefits: $benefits, whatAppNum: $whatAppNum, discount: $discount)';
  }

  @override
  bool operator ==(covariant MedicalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.education == education &&
        other.experience == experience &&
        other.benefits == benefits &&
        other.whatAppNum == whatAppNum &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        education.hashCode ^
        experience.hashCode ^
        benefits.hashCode ^
        whatAppNum.hashCode ^
        discount.hashCode;
  }
}
