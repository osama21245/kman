// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GymModel {
  final String id;
  final String name;
  final String benefits;
  final String link;
  final String logo;
  final String address;
  final double long;
  final double lat;
  final bool ismix;
  final int price;
  GymModel({
    required this.id,
    required this.name,
    required this.benefits,
    required this.link,
    required this.logo,
    required this.address,
    required this.long,
    required this.lat,
    required this.ismix,
    required this.price,
  });

  GymModel copyWith({
    String? id,
    String? name,
    String? benefits,
    String? link,
    String? logo,
    String? address,
    double? long,
    double? lat,
    bool? ismix,
    int? price,
  }) {
    return GymModel(
      id: id ?? this.id,
      name: name ?? this.name,
      benefits: benefits ?? this.benefits,
      link: link ?? this.link,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      long: long ?? this.long,
      lat: lat ?? this.lat,
      ismix: ismix ?? this.ismix,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'benefits': benefits,
      'link': link,
      'logo': logo,
      'address': address,
      'long': long,
      'lat': lat,
      'ismix': ismix,
      'price': price,
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      id: map['id'] as String,
      name: map['name'] as String,
      benefits: map['benefits'] as String,
      link: map['link'] as String,
      logo: map['logo'] as String,
      address: map['address'] as String,
      long: map['long'] as double,
      lat: map['lat'] as double,
      ismix: map['ismix'] as bool,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) =>
      GymModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymModel(id: $id, name: $name, benefits: $benefits, link: $link, logo: $logo, address: $address, long: $long, lat: $lat, ismix: $ismix, price: $price)';
  }

  @override
  bool operator ==(covariant GymModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.benefits == benefits &&
        other.link == link &&
        other.logo == logo &&
        other.address == address &&
        other.long == long &&
        other.lat == lat &&
        other.ismix == ismix &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        benefits.hashCode ^
        link.hashCode ^
        logo.hashCode ^
        address.hashCode ^
        long.hashCode ^
        lat.hashCode ^
        ismix.hashCode ^
        price.hashCode;
  }
}
