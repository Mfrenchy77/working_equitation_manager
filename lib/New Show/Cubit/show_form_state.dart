// ignore_for_file: constant_identifier_names

part of 'show_form_cubit.dart';

class ShowFormState extends Equatable {
  final Show? show;
  final bool isError;
  final bool? isDraft;
  final int currentPage;
  final int? regionNumber;
  final int? licenseNumber;
  final ShowType? showType;
  final List<Rider> riders;
  final String errorMessage;
  final String? facilityCity;
  final String? showLocation;
  final String? facilityName;
  final bool isLicenseNeeded;
  final String? facilityState;
  final Official? gateSteward;
  final List<Official> judges;
  final Official? showSecretary;
  final String? facilityAddress;
  final String? competitionName;
  final bool cattleTrialOffered;
  final List<int>? levelsOffered;
  final List<Official> showOrganizers;
  final List<Official> otherOfficials;
  final DateTime? showEndDateAndEndTime;
  final List<Official> technicalDelegates;
  final DateTime? showStartDateAndStartTime;

  const ShowFormState({
    this.show,
    this.isDraft,
    this.showType,
    this.gateSteward,
    this.facilityCity,
    this.showLocation,
    this.facilityName,
    this.regionNumber,
    this.licenseNumber,
    this.facilityState,
    this.showSecretary,
    this.levelsOffered,
    this.isError = false,
    this.currentPage = 0,
    this.facilityAddress,
    this.competitionName,
    this.judges = const [],
    this.riders = const [],
    this.errorMessage = '',
    this.showEndDateAndEndTime,
    this.isLicenseNeeded = false,
    this.cattleTrialOffered = false,
    this.showOrganizers = const [],
    this.otherOfficials = const [],
    this.showStartDateAndStartTime,
    this.technicalDelegates = const [],
  });

  ShowFormState copyWith({
    Show? show,
    bool? isDraft,
    bool? isError,
    int? currentPage,
    int? regionNumber,
    ShowType? showType,
    int? licenseNumber,
    List<Rider>? riders,
    String? facilityCity,
    String? showLocation,
    String? facilityName,
    String? errorMessage,
    Official? gateSteward,
    String? facilityState,
    bool? isLicenseNeeded,
    List<Official>? judges,
    String? facilityAddress,
    String? competitionName,
    Official? showSecretary,
    List<int>? levelsOffered,
    bool? cattleTrialOffered,
    List<Official>? showOrganizers,
    List<Official>? otherOfficials,
    DateTime? showEndDateAndEndTime,
    List<Official>? technicalDelegates,
    DateTime? showStartDateAndStartTime,
  }) {
    return ShowFormState(
      show: show ?? this.show,
      judges: judges ?? this.judges,
      riders: riders ?? this.riders,
      isError: isError ?? this.isError,
      isDraft: isDraft ?? this.isDraft,
      showType: showType ?? this.showType,
      currentPage: currentPage ?? this.currentPage,
      gateSteward: gateSteward ?? this.gateSteward,
      errorMessage: errorMessage ?? this.errorMessage,
      facilityCity: facilityCity ?? this.facilityCity,
      showLocation: showLocation ?? this.showLocation,
      facilityName: facilityName ?? this.facilityName,
      regionNumber: regionNumber ?? this.regionNumber,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      facilityState: facilityState ?? this.facilityState,
      showSecretary: showSecretary ?? this.showSecretary,
      levelsOffered: levelsOffered ?? this.levelsOffered,
      showOrganizers: showOrganizers ?? this.showOrganizers,
      otherOfficials: otherOfficials ?? this.otherOfficials,
      isLicenseNeeded: isLicenseNeeded ?? this.isLicenseNeeded,
      facilityAddress: facilityAddress ?? this.facilityAddress,
      competitionName: competitionName ?? this.competitionName,
      cattleTrialOffered: cattleTrialOffered ?? this.cattleTrialOffered,
      technicalDelegates: technicalDelegates ?? this.technicalDelegates,
      showEndDateAndEndTime:
          showEndDateAndEndTime ?? this.showEndDateAndEndTime,
      showStartDateAndStartTime:
          showStartDateAndStartTime ?? this.showStartDateAndStartTime,
    );
  }

  @override
  List<Object?> get props => [
        show,
        judges,
        riders,
        isDraft,
        isError,
        showType,
        gateSteward,
        currentPage,
        facilityCity,
        showLocation,
        facilityName,
        regionNumber,
        errorMessage,
        licenseNumber,
        facilityState,
        showSecretary,
        levelsOffered,
        showOrganizers,
        otherOfficials,
        facilityAddress,
        competitionName,
        isLicenseNeeded,
        cattleTrialOffered,
        technicalDelegates,
        showEndDateAndEndTime,
        showStartDateAndStartTime,
      ];
}
