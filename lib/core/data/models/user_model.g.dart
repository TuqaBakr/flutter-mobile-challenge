// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserModel', json, ($checkedConvert) {
      final val = UserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        fullName: $checkedConvert('fullName', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        gender: $checkedConvert('gender', (v) => v as String),
        phone: $checkedConvert('phone', (v) => v as String),
        birthDate: $checkedConvert('birthDate', (v) => v as String?),
        role: $checkedConvert('role', (v) => v as String),
        recordStatus: $checkedConvert(
          'recordStatus',
          (v) => (v as num?)?.toInt(),
        ),
        creationDate: $checkedConvert(
          'creationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        modificationDate: $checkedConvert(
          'modificationDate',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'birthDate': instance.birthDate,
  'role': instance.role,
  'recordStatus': instance.recordStatus,
  'creationDate': instance.creationDate?.toIso8601String(),
  'modificationDate': instance.modificationDate?.toIso8601String(),
};
