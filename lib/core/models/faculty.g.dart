// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faculty _$FacultyFromJson(Map<String, dynamic> json) {
  return Faculty(
    id: json['_id'] as String,
    name: json['name'] as String,
    school: json['school'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$FacultyToJson(Faculty instance) => <String, dynamic>{
      '_id': instance.id,
      'school': instance.school,
      'name': instance.name,
      'description': instance.description,
    };
