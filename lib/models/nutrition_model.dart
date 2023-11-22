// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NutritionModel {
  final String? id;
  final String? name;
  final int rating;
  final String education;
  final String experience;
  final String whatsAppNum;
  final String benefits;
  final int discount;
  NutritionModel({
    this.id,
    this.name,
    required this.rating,
    required this.education,
    required this.experience,
    required this.whatsAppNum,
    required this.benefits,
    required this.discount,
  });

  NutritionModel copyWith({
    String? id,
    String? name,
    int? rating,
    String? education,
    String? experience,
    String? whatsAppNum,
    String? benefits,
    int? discount,
  }) {
    return NutritionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      whatsAppNum: whatsAppNum ?? this.whatsAppNum,
      benefits: benefits ?? this.benefits,
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
      'whatsAppNum': whatsAppNum,
      'benefits': benefits,
      'discount': discount,
    };
  }

  factory NutritionModel.fromMap(Map<String, dynamic> map) {
    return NutritionModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      rating: map['rating'] as int,
      education: map['education'] as String,
      experience: map['experience'] as String,
      whatsAppNum: map['whatsAppNum'] as String,
      benefits: map['benefits'] as String,
      discount: map['discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NutritionModel.fromJson(String source) =>
      NutritionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NutritionModel(id: $id, name: $name, rating: $rating, education: $education, experience: $experience, whatsAppNum: $whatsAppNum, benefits: $benefits, discount: $discount)';
  }

  @override
  bool operator ==(covariant NutritionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.education == education &&
        other.experience == experience &&
        other.whatsAppNum == whatsAppNum &&
        other.benefits == benefits &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        rating.hashCode ^
        education.hashCode ^
        experience.hashCode ^
        whatsAppNum.hashCode ^
        benefits.hashCode ^
        discount.hashCode;
  }
}
