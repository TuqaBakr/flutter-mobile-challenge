  import 'package:json_annotation/json_annotation.dart';

  part 'user_model.g.dart';

  @JsonSerializable(checked: true)
  class UserModel {
    final int id;
    final String fullName;
    final String email;
    final String gender;
    final String phone;
    final String? birthDate;
    final String role;
    final int? recordStatus;
    @JsonKey(name: 'creationDate')
    final DateTime? creationDate;
    @JsonKey(name: 'modificationDate')
    final DateTime? modificationDate;

    UserModel( {
      required this.id,
      required this.fullName,
      required this.email,
      required this.gender,
      required this.phone,
      this.birthDate,
      required this.role,
       this.recordStatus,
       this.creationDate,
      this.modificationDate,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) =>
        _$UserModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserModelToJson(this);

    UserModel copyWith({
      int? id,
      String? fullName,
      String? email,
      String? gender,
      String? phone,
      String? birthDate,
      String? role,
      int? recordStatus,
      DateTime? creationDate,
      DateTime? modificationDate,
    }) {
      return UserModel(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
        birthDate: birthDate ?? this.birthDate,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        creationDate: creationDate ?? this.creationDate,
        modificationDate: modificationDate ?? this.modificationDate,
      );
    }
  }
