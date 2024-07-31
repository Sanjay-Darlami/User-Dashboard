import 'package:demo_project/models/user/geo.dart';

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toJson(),
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['street'],
      json['suite'],
      json['city'],
      json['zipcode'],
      json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}
