import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
import 'package:flutter/material.dart';

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phoneNumber;
  String? userType;
  bool? isVerified;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.phoneNumber,
        this.userType,
        this.isVerified,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    isVerified = json['isVerified'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['isVerified'] = this.isVerified;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}


class AuthToken {
  String? token;

  AuthToken({this.token});
  factory AuthToken.fromJson(String token) {
    return AuthToken(
      token: token,
    );
  }

  @override
  String toString() => 'AuthToken(token: $token)';
}
