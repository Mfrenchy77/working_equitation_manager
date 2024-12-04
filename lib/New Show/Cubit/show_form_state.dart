// ignore_for_file: constant_identifier_names

part of 'show_form_cubit.dart';

enum ShowType { Schooling, Licensed, Championship }

class ShowFormState extends Equatable {
  final Show? show;
  final bool isError;
  final bool? isDraft;
  final int currentPage;
  final int? regionNumber;
  final int? licenseNumber;
  final ShowType? showType;
  final String errorMessage;
  final List<Rider>? riders;
  final String? showLocation;
  final List<String>? judges;
  final String? facilityName;
  final bool isLicenseNeeded;
  final String? facilityAddress;
  final String? competitionName;
  final List<String>? showOrganizers;
  final DateTime? showDateAndStartTime;

  const ShowFormState({
    this.show,
    this.riders,
    this.judges,
    this.isDraft,
    this.showType,
    this.facilityName,
    this.showLocation,
    this.regionNumber,
    this.licenseNumber,
    this.showOrganizers,
    this.isError = false,
    this.currentPage = 0,
    this.facilityAddress,
    this.competitionName,
    this.errorMessage = '',
    this.showDateAndStartTime,
    this.isLicenseNeeded = false,
  });

  ShowFormState copyWith({
    Show? show,
    bool? isDraft,
    bool? isError,
    int? currentPage,
    int? regionNumber,
    int? licenseNumber,
    ShowType? showType,
    List<Rider>? riders,
    String? errorMessage,
    String? facilityName,
    List<String>? judges,
    String? showLocation,
    bool? isLicenseNeeded,
    String? facilityAddress,
    String? competitionName,
    List<String>? showOrganizers,
    DateTime? showDateAndStartTime,
  }) {
    return ShowFormState(
      show: show ?? this.show,
      riders: riders ?? this.riders,
      judges: judges ?? this.judges,
      isError: isError ?? this.isError,
      isDraft: isDraft ?? this.isDraft,
      showType: showType ?? this.showType,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage ?? this.errorMessage,
      showLocation: showLocation ?? this.showLocation,
      regionNumber: regionNumber ?? this.regionNumber,
      facilityName: facilityName ?? this.facilityName,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      showOrganizers: showOrganizers ?? this.showOrganizers,
      facilityAddress: facilityAddress ?? this.facilityAddress,
      competitionName: competitionName ?? this.competitionName,
      isLicenseNeeded: isLicenseNeeded ?? this.isLicenseNeeded,
      showDateAndStartTime: showDateAndStartTime ?? this.showDateAndStartTime,
    );
  }

  @override
  List<Object?> get props => [
        show,
        riders,
        judges,
        isDraft,
        isError,
        showType,
        currentPage,
        errorMessage,
        facilityName,
        showLocation,
        regionNumber,
        licenseNumber,
        showOrganizers,
        isLicenseNeeded,
        competitionName,
        facilityAddress,
        showDateAndStartTime,
      ];
}
