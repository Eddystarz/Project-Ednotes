import 'package:edtech/core/models/faculty.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


part 'department.g.dart';


@JsonSerializable()
class Department {
//   _id: ID!
// school: School!
// faculty: Faculty!
// name: String!
// description: String!

  String? id;
  String? school;
  Faculty? faculty;
  String? description;
  String? name;

  Department({@required this.id, this.name, this.faculty, this.description});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
