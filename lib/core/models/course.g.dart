// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
    id: json['id'] as String,
    school: json['school'] == null
        ? null
        : School.fromJson(json['school'] as Map<String, dynamic>),
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    department: json['department'] == null
        ? null
        : Department.fromJson(json['department'] as Map<String, dynamic>),
    level: json['level'] == null
        ? null
        : Level.fromJson(json['level'] as Map<String, dynamic>),
    name: json['name'] as String,
    description: json['description'] as String,
    semester: json['semester'] as String,
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'faculty': instance.faculty,
      'department': instance.department,
      'level': instance.level,
      'name': instance.name,
      'description': instance.description,
      'semester': instance.semester,
    };
