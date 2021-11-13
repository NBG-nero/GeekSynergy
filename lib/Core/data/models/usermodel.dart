// import 'package:flutter/foundation.dart';
// import 'dart:convert';

class User {
  final String name, email, password, phone, category;

  User({this.name, this.email, this.password, this.phone, this.category});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      name: jsonData['name'],
      email: jsonData['email'],
      password: jsonData['password'],
      phone: jsonData['phone'],
      category: jsonData['category'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'category': category,
      };
}
