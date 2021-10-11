import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faculty.g.dart';


@JsonSerializable()
class Faculty {
//   _id: ID!
// school: School!
// name: String!
// description: Str
  String? id;
  String? school;
  String? name;
  String? description;

  Faculty({
    @required this.id,
    @required this.name,
    this.school,
    this.description,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) =>
      _$FacultyFromJson(json);
  Map<String, dynamic> toJson() => _$FacultyToJson(this);
}
