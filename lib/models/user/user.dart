import 'package:demo_project/models/user/address.dart';
import 'package:demo_project/models/user/company.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  Company? company;

  User(this.id, this.name, this.username, this.email, this.address, this.phone,
      this.company);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'company': company?.toJson(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['username'],
      json['email'],
      json['address'] != null ? Address.fromJson(json['address']) : null,
      json['phone'],
      json['company'] != null ? Company.fromJson(json['company']) : null,
    );
  }
}
