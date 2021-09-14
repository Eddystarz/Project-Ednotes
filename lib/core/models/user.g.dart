// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    username: json['username'] as String,
    id: json['id'] as String,
    email: json['email'] as String,
    isVerified: json['isVerified'] as bool,
    isActive: json['isActive'] as bool,
    age: json['age'] as String,
    department: json['department'] == null
        ? null
        : Department.fromJson(json['department'] as Map<String, dynamic>),
    school: json['school'] == null
        ? null
        : School.fromJson(json['school'] as Map<String, dynamic>),
    faculty: json['faculty'] == null
        ? null
        : Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    university: json['university'] as String,
    level: json['level'] == null
        ? null
        : Level.fromJson(json['level'] as Map<String, dynamic>),
    state: json['state'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  )..phoneNumber = json['phoneNumber'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'isActive': instance.isActive,
      'age': instance.age,
      'phoneNumber': instance.phoneNumber,
      'school': instance.school,
      'department': instance.department,
      'faculty': instance.faculty,
      'level': instance.level,
      'university': instance.university,
      'state': instance.state,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
