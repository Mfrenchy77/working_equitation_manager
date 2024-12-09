// ignore_for_file: constant_identifier_names

import 'package:objectbox/objectbox.dart';
import 'package:working_equitation_manager/Database/Models/offical.dart';
import 'package:working_equitation_manager/Database/Models/rider.dart';

enum ShowType {
  Schooling,
  Licensed,
  Championship,
}

enum Levels {
  L1,
  L2,
  L3,
  L4,
  L5,
  L6,
  L7,
}

@Entity()
class Show {
  @Id()
  int? id;

  /// Indicates if the show is a draft
  bool isDraft;

  /// Region number of the show
  int? regionNumber;

  /// Facility information
  String? facilityName;
  String? facilityAddress;
  String? facilityCity;
  String? facilityState;

  /// Competition details
  String? competitionName;
  @Property(type: PropertyType.date)
  DateTime? showStartDateAndStartTime;
  @Property(type: PropertyType.date)
  DateTime? showEndDateAndEndTime;

  /// Show type (backed by enum)
  @Transient()
  ShowType? showType;

  int? get dbShowType {
    _ensureStableEnumValues();
    return showType?.index;
  }

  set dbShowType(int? value) {
    _ensureStableEnumValues();
    if (value == null) {
      showType = ShowType.Schooling;
    } else {
      showType = value >= 0 && value < ShowType.values.length
          ? ShowType.values[value]
          : ShowType.Schooling;
    }
  }

  /// Levels offered (e.g., L1, L2)
  List<int>? levelsOffered;

  /// License number of the show
  int? showLicenseNumber;

  /// Whether the cattle trial is offered
  bool cattleTrialOffered;

  /// Officials for the show
  final judges = ToMany<Official>();
  final gateSteward = ToOne<Official>();
  final showSecretary = ToOne<Official>();
  final otherOfficials = ToMany<Official>();
  final showOrganizers = ToMany<Official>();
  final technicalDelegates = ToMany<Official>();

  /// Riders participating in the show
  final riders = ToMany<Rider>();

  Show({
    this.id,
    this.showType,
    this.regionNumber,
    this.facilityName,
    this.facilityCity,
    this.facilityState,
    this.levelsOffered,
    this.isDraft = true,
    this.facilityAddress,
    this.competitionName,
    this.showLicenseNumber,
    this.showEndDateAndEndTime,
    this.showStartDateAndStartTime,
    this.cattleTrialOffered = false,
  });

  Show copyWith({
    int? id,
    bool? isDraft,
    int? regionNumber,
    ShowType? showType,
    String? facilityName,
    String? facilityCity,
    String? facilityState,
    int? showLicenseNumber,
    String? competitionName,
    String? facilityAddress,
    List<int>? levelsOffered,
    bool? cattleTrialOffered,
    DateTime? showEndDateAndEndTime,
    DateTime? showStartDateAndStartTime,
  }) {
    return Show(
      id: id ?? this.id,
      isDraft: isDraft ?? this.isDraft,
      showType: showType ?? this.showType,
      regionNumber: regionNumber ?? this.regionNumber,
      facilityName: facilityName ?? this.facilityName,
      facilityCity: facilityCity ?? this.facilityCity,
      facilityState: facilityState ?? this.facilityState,
      levelsOffered: levelsOffered ?? this.levelsOffered,
      competitionName: competitionName ?? this.competitionName,
      facilityAddress: facilityAddress ?? this.facilityAddress,
      showLicenseNumber: showLicenseNumber ?? this.showLicenseNumber,
      cattleTrialOffered: cattleTrialOffered ?? this.cattleTrialOffered,
      showEndDateAndEndTime:
          showEndDateAndEndTime ?? this.showEndDateAndEndTime,
      showStartDateAndStartTime:
          showStartDateAndStartTime ?? this.showStartDateAndStartTime,
    );
  }

  @override
  String toString() {
    return 'Show{id: $id, competitionName: $competitionName, showType: $showType, facilityName: $facilityName, regionNumber: $regionNumber, levelsOffered: $levelsOffered, cattleTrialOffered: $cattleTrialOffered}';
  }

  void _ensureStableEnumValues() {
    assert(ShowType.Schooling.index == 0);
    assert(ShowType.Licensed.index == 1);
    assert(ShowType.Championship.index == 2);
  }
}
