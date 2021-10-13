// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return Department(
    id: json['_id'] as String,
    name: json['name'] as String,
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    description: json['description'] as String,
  )..school = json['school'] as String;
}

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'school': instance.school,
      'faculty': instance.faculty,
      'description': instance.description,
      'name': instance.name,
    };
