import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@JsonSerializable()
class School {
//   _id: ID!
// name: String!
// description: String!
// location: String!
// created_by: User!
// faculties: [Faculty]
// departments: [Dept]
// levels: [Level]
  String? id;
  String? name;

  String? description;
  String? location;
  User? createdBy;
  List<Faculty?>? faculties;
  List<Department?>? departments;
  List<Level?>? levels;

  School(
      {this.id,
      this.name,
      this.description,
      this.location,
      this.createdBy,
      this.faculties,
      this.departments,
      this.levels});

  factory School.fromJson(Map<String, dynamic> json) =>
      _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
