// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
    id: json['id'] as String,
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    department: json['department'] == null
        ? null
        : Department.fromJson(json['department'] as Map<String, dynamic>),
    name: json['name'] as String,
    description: json['description'] as String,
    students: (json['students'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'id': instance.id,
      'faculty': instance.faculty,
      'department': instance.department,
      'name': instance.name,
      'description': instance.description,
      'students': instance.students,
    };
