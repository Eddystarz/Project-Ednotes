// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) {
  return School(
    id: json['_id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    location: json['location'] as String,
    createdBy: json['created_by'] == null
        ? null
        : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    faculties: (json['faculties'] as List)
        .map((e) =>
            e == null ? null : Faculty.fromJson(e as Map<String, dynamic>))
        .toList(),
    departments: (json['departments'] as List)
        .map((e) =>
            e == null ? null : Department.fromJson(e as Map<String, dynamic>))
        .toList(),
    levels: (json['levels'] as List)
        .map(
            (e) => e == null ? null : Level.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'created_by': instance.createdBy,
      'faculties': instance.faculties,
      'departments': instance.departments,
      'levels': instance.levels,
    };
