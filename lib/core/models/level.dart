// import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';

part 'level.g.dart';

@JsonSerializable()
class Level {
//   _id: ID!
// school: School!
// faculty: Faculty!
// dept: Dept!
// name: String!
// description: String!
// students: [ID]

  String? id;
  Faculty? faculty;
  Department? department;
  String? name;
  String? description;
  List<String>? students;
  Level({
     this.id,
     this.faculty,
     this.department,
     this.name,
     this.description,
     this.students,
  });

  factory Level.fromJson(Map<String, dynamic> json) =>
      _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
  
  }
