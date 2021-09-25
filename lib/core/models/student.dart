import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
import 'package:edtech/core/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  String id;
  User user;
  String state;
  School school;
  Faculty faculty;
  Department dept;
  Level level;
  DateTime createdAt;
  DateTime updatedAt;
  Student({
    this.id,
    this.user,
    this.state,
    this.school,
    this.faculty,
    this.dept,
    this.level,
    this.createdAt,
    this.updatedAt,
  });
  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
