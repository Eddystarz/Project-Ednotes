// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    id: json['_id'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    state: json['state'] as String,
    school: json['school'] == null
        ? null
        : School.fromJson(json['school'] as Map<String, dynamic>),
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    dept: json['dept'] == null
        ? null
        : Department.fromJson(json['dept'] as Map<String, dynamic>),
    level: json['level'] == null
        ? null
        : Level.fromJson(json['level'] as Map<String, dynamic>),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'state': instance.state,
      'school': instance.school,
      'faculty': instance.faculty,
      'dept': instance.dept,
      'level': instance.level,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
