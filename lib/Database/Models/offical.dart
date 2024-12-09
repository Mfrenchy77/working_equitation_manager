// ignore_for_file: constant_identifier_names

import 'package:objectbox/objectbox.dart';

enum OfficialRole {
  Unknown,
  Judge,
  TechnicalDelegate,
  GateSteward,
  ShowManager,
  ShowSecretary,
  Other,
}

/// The type of Judge L- is Learner, r- is Recorded,
/// R- is Registered, S- is Senior
enum JudgeType { L, r, R, S }

@Entity()
class Official {
  @Id()
  int? id;

  /// The name of the official.
  final String name;

  /// The role of the official (e.g., Judge, Show Secretary).
  @Transient()
  OfficialRole role;

  /// The email address of the official.
  final String? email;

  /// The phone number of the official.
  final String? phoneNumber;

  /// The type of judge (L, r, R, S) if the official is a judge.
  /// This field is only used if the official is a judge.
  @Transient()
  JudgeType? judgeType;

  /// Field for ObjectBox to store the role enum value.
  int? get dbRole {
    _ensureStableEnumValues();
    return role.index;
  }

  set dbRole(int? value) {
    _ensureStableEnumValues();
    if (value == null) {
      role = OfficialRole.Unknown;
    } else {
      role = value >= 0 && value < OfficialRole.values.length
          ? OfficialRole.values[value]
          : OfficialRole.Unknown;
    }
  }

  /// Field for ObjectBox to store the judgeType enum value.
  int? get dbJudgeType {
    _ensureStableJudgeEnumValues();
    return judgeType?.index;
  }

  set dbJudgeType(int? value) {
    _ensureStableJudgeEnumValues();
    if (value == null) {
      judgeType = null;
    } else {
      judgeType = value >= 0 && value < JudgeType.values.length
          ? JudgeType.values[value]
          : null; // Defaults to null for unsupported values
    }
  }

  Official({
    this.id,
    this.email,
    this.phoneNumber,
    required this.name,
    this.role = OfficialRole.Unknown,
    this.judgeType,
  });

  Official copyWith({
    String? name,
    String? email,
    OfficialRole? role,
    String? phoneNumber,
    JudgeType? judgeType,
  }) {
    return Official(
      id: id,
      name: name ?? this.name,
      role: role ?? this.role,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      judgeType: judgeType ?? this.judgeType,
    );
  }

  @override
  String toString() {
    return 'Official{id: $id, name: $name, role: $role, judgeType: $judgeType, email: $email, phoneNumber: $phoneNumber}';
  }

  void _ensureStableEnumValues() {
    assert(OfficialRole.Unknown.index == 0);
    assert(OfficialRole.Judge.index == 1);
    assert(OfficialRole.TechnicalDelegate.index == 2);
    assert(OfficialRole.GateSteward.index == 3);
    assert(OfficialRole.ShowManager.index == 4);
    assert(OfficialRole.ShowSecretary.index == 5);
    assert(OfficialRole.Other.index == 6);
  }

  void _ensureStableJudgeEnumValues() {
    assert(JudgeType.L.index == 0);
    assert(JudgeType.r.index == 1);
    assert(JudgeType.R.index == 2);
    assert(JudgeType.S.index == 3);
  }
}
