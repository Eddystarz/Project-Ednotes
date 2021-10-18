import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
//   firstName: String!
// lastName: String!
// username: String!
// email: String!
// userType: String!
// isVerified: Boolean
// isActive: Boolean
// createdAt: DateTime!
// updatedAt: DateTime!
  @JsonKey(name: "_id")
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  bool? isVerified;
  bool? isActive;
  // String age;
  String? phoneNumber;
  String? userType;

  DateTime? createdAt;
  DateTime? updatedAt;

  User(
      {@required this.firstName,
      @required this.lastName,
      @required this.username,
      this.id,
      this.email,
      this.isVerified,
      this.isActive,
      this.createdAt,
      this.userType,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class AuthToken {
  String? token;

  AuthToken({ this.token});
  factory AuthToken.fromJson(String token) {
    return AuthToken(
      token: token,
    );
  }

  @override
  String toString() => 'AuthToken(token: $token)';
}
