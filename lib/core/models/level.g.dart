// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
    id: json['_id'] as String,
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    department: json['dept'] == null
        ? null
        : Department.fromJson(json['dept'] as Map<String, dynamic>),
    name: json['name'] as String,
    description: json['description'] as String,
    students: (json['students'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      '_id': instance.id,
      'faculty': instance.faculty,
      'dept': instance.department,
      'name': instance.name,
      'description': instance.description,
      'students': instance.students,
    };
