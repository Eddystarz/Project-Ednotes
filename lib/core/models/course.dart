import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
import 'package:json_annotation/json_annotation.dart';


part 'course.g.dart';


@JsonSerializable()
class Course {
//   _id: ID!
// school: School
// faculty: Faculty
// dept: Dept
// level: Level
// name: String
// description: String
// semester: String

  String id;
  School school;
  Faculty faculty;
  Department department;
  Level level;
  String name;
  String description;
  String semester;
  Course({
     this.id,
     this.school,
     this.faculty,
     this.department,
     this.level,
     this.name,
     this.description,
     this.semester,
  });


factory Course.fromJson(Map<String, dynamic> json) =>
      _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Course &&
      other.id == id &&
      other.school == school &&
      other.faculty == faculty &&
      other.department == department &&
      other.level == level &&
      other.name == name &&
      other.description == description &&
      other.semester == semester;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      school.hashCode ^
      faculty.hashCode ^
      department.hashCode ^
      level.hashCode ^
      name.hashCode ^
      description.hashCode ^
      semester.hashCode;
  }
}
