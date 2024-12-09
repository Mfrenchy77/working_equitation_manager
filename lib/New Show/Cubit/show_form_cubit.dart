import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/offical.dart';
import 'package:working_equitation_manager/Database/Models/rider.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';

part 'show_form_state.dart';

class ShowFormCubit extends Cubit<ShowFormState> {
  final ObjectBox objectBox;

  ShowFormCubit({required this.objectBox, Show? draftShow})
      : super(ShowFormState(show: draftShow)) {
    if (draftShow != null) {
      emit(state.copyWith(
        show: draftShow,
        showType: draftShow.showType,
        facilityName: draftShow.facilityName,
        regionNumber: draftShow.regionNumber,
        facilityCity: draftShow.facilityCity,
        facilityState: draftShow.facilityState,
        levelsOffered: draftShow.levelsOffered,
        gateSteward: draftShow.gateSteward.target,
        judges: draftShow.judges.toSet().toList(),
        riders: draftShow.riders.toSet().toList(),
        facilityAddress: draftShow.facilityAddress,
        competitionName: draftShow.competitionName,
        licenseNumber: draftShow.showLicenseNumber,
        showSecretary: draftShow.showSecretary.target,
        cattleTrialOffered: draftShow.cattleTrialOffered,
        showEndDateAndEndTime: draftShow.showEndDateAndEndTime,
        otherOfficials: draftShow.otherOfficials.toSet().toList(),
        showStartDateAndStartTime: draftShow.showStartDateAndStartTime,
        technicalDelegates: draftShow.technicalDelegates.toSet().toList(),
      ));
    }
  }

  /// Save the current state of the show to the database
  void _saveOrUpdateShow() {
    debugPrint('Save or update show');
    if (state.show != null) {
      final show = state.show!;
      if (show.id != null && show.id! > 0) {
        debugPrint('Updating show with id: ${show.id}');

        // Ensure unique entries by removing duplicates
        final updatedRiders = {...show.riders, ...state.riders}.toList();
        final updatedJudges = {...show.judges, ...state.judges}.toList();
        final updatedShowOrganizers =
            {...show.showOrganizers, ...state.showOrganizers}.toList();
        final updatedOtherOfficials =
            {...show.otherOfficials, ...state.otherOfficials}.toList();
        final updatedTechnicalDelegates =
            {...show.technicalDelegates, ...state.technicalDelegates}.toList();

        // Update gateSteward and showSecretary
        show.gateSteward.target = state.gateSteward;
        show.showSecretary.target = state.showSecretary;

        // Replace existing ToMany relations
        show.riders.clear();
        show.riders.addAll(updatedRiders);

        show.judges.clear();
        show.judges.addAll(updatedJudges);

        show.showOrganizers.clear();
        show.showOrganizers.addAll(updatedShowOrganizers);

        show.otherOfficials.clear();
        show.otherOfficials.addAll(updatedOtherOfficials);

        show.technicalDelegates.clear();
        show.technicalDelegates.addAll(updatedTechnicalDelegates);

        // Update the show in the database
        objectBox.updateShow(show);
      } else {
        debugPrint('Creating new show');

        final newShow = Show(
          showType: state.showType,
          facilityCity: state.facilityCity,
          facilityName: state.facilityName,
          regionNumber: state.regionNumber,
          facilityState: state.facilityState,
          levelsOffered: state.levelsOffered,
          showLicenseNumber: state.licenseNumber,
          competitionName: state.competitionName,
          facilityAddress: state.facilityAddress,
          cattleTrialOffered: state.cattleTrialOffered,
          showEndDateAndEndTime: state.showEndDateAndEndTime,
          showStartDateAndStartTime: state.showStartDateAndStartTime,
        );

        // Assign gateSteward and showSecretary
        newShow.gateSteward.target = state.gateSteward;
        newShow.showSecretary.target = state.showSecretary;

        // Assign unique lists to the ToMany relationships
        newShow.riders.addAll(state.riders.toSet());
        newShow.judges.addAll(state.judges.toSet());
        newShow.showOrganizers.addAll(state.showOrganizers.toSet());
        newShow.otherOfficials.addAll(state.otherOfficials.toSet());
        newShow.technicalDelegates.addAll(state.technicalDelegates.toSet());

        final newShowId = objectBox.addShow(newShow);
        debugPrint('Created new show with id: $newShowId');
        emit(state.copyWith(show: newShow.copyWith(id: newShowId)));
      }
    } else {
      debugPrint('State.show is null');
      debugPrint('Creating new show');

      final newShow = Show(
        showType: state.showType,
        facilityCity: state.facilityCity,
        facilityName: state.facilityName,
        regionNumber: state.regionNumber,
        facilityState: state.facilityState,
        levelsOffered: state.levelsOffered,
        showLicenseNumber: state.licenseNumber,
        competitionName: state.competitionName,
        facilityAddress: state.facilityAddress,
        cattleTrialOffered: state.cattleTrialOffered,
        showEndDateAndEndTime: state.showEndDateAndEndTime,
        showStartDateAndStartTime: state.showStartDateAndStartTime,
      );

      // Assign gateSteward and showSecretary
      newShow.gateSteward.target = state.gateSteward;
      newShow.showSecretary.target = state.showSecretary;

      // Assign unique lists to the ToMany relationships
      newShow.riders.addAll(state.riders.toSet());
      newShow.judges.addAll(state.judges.toSet());
      newShow.showOrganizers.addAll(state.showOrganizers.toSet());
      newShow.otherOfficials.addAll(state.otherOfficials.toSet());
      newShow.technicalDelegates.addAll(state.technicalDelegates.toSet());

      final newShowId = objectBox.addShow(newShow);
      debugPrint('Created new show with id: $newShowId');
      emit(state.copyWith(show: newShow.copyWith(id: newShowId)));
    }
  }

  /// Save when the user presses Next or Back or closes the form
  void saveShow() {
    _saveOrUpdateShow();
  }

  /// Navigate to the next page and save the current state
  void nextPage() {
    // if the current page is the last page, save the show
    // and navigate to the Main Show Page.
    if (state.currentPage == 5) {
      saveShow();
      debugPrint('Navigating to main show page');
    } else {
      saveShow();
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  /// Navigate to the previous page
  void previousPage() {
    saveShow();
    emit(state.copyWith(currentPage: state.currentPage - 1));
  }

  /// Set the current page of the form
  void setPage(int page) {
    saveShow();
    emit(state.copyWith(currentPage: page));
  }

  /// Method that lets the next button be enabled based on the current page
  /// and if the required fields are filled
  bool isNextButtonEnabled() {
    switch (state.currentPage) {
      case 0:
        return state.competitionName != null &&
            state.facilityName != null &&
            state.facilityAddress != null &&
            state.regionNumber != null &&
            state.showStartDateAndStartTime != null &&
            state.showEndDateAndEndTime != null &&
            state.facilityCity != null &&
            state.facilityState != null;
      case 1:
        return state.showType != null;
      case 2:
        return state.levelsOffered != null;
      case 3:
        return state.show?.showType == ShowType.Schooling ||
            state.licenseNumber != null ||
            state.isLicenseNeeded;
      case 4:
        return state.judges.isNotEmpty;
      case 5:
        return true;
      default:
        return false;
    }
  }

  // Update show details in Cubit state only
  // No database write happens here; it’s purely state updates

  /// Monitors the competition show type
  void setShowType(ShowType showType) {
    emit(state.copyWith(
      showType: showType,
      show: state.show?.copyWith(showType: showType),
    ));
    emit(state.copyWith(isLicenseNeeded: showType != ShowType.Schooling));
  }

  /// Monitors the competition name
  void competitionNameChanged(String competitionName) {
    emit(state.copyWith(
      competitionName: competitionName,
      show: state.show?.copyWith(competitionName: competitionName),
    ));
  }

  /// Monitors the facility name
  void facilityNameChanged(String facilityName) {
    emit(state.copyWith(
      facilityName: facilityName,
      show: state.show?.copyWith(facilityName: facilityName),
    ));
  }

  /// Monitors the facility city
  void facilityCityChanged(String facilityCity) {
    emit(state.copyWith(
      facilityCity: facilityCity,
      show: state.show?.copyWith(facilityCity: facilityCity),
    ));
  }

  /// Monitors the facility state
  void facilityStateChanged(String facilityState) {
    emit(state.copyWith(
      facilityState: facilityState,
      show: state.show?.copyWith(facilityState: facilityState),
    ));
  }

  /// Monitors the levels offered
  void levelsOfferedChanged(List<int> levelsOffered) {
    levelsOffered.sort();
    emit(state.copyWith(
      levelsOffered: levelsOffered,
      show: state.show?.copyWith(levelsOffered: levelsOffered),
    ));
  }

  /// Monitors the cattle trial offered
  void cattleTrialOfferedChanged(bool cattleTrialOffered) {
    emit(state.copyWith(
      cattleTrialOffered: cattleTrialOffered,
      show: state.show?.copyWith(cattleTrialOffered: cattleTrialOffered),
    ));
  }

  /// Monitors the facility address
  void facilityAddressChanged(String facilityAddress) {
    emit(state.copyWith(
      facilityAddress: facilityAddress,
      show: state.show?.copyWith(facilityAddress: facilityAddress),
    ));
  }

  /// Monitors the Show date and start time
  void showStartDateAndStartTimeChanged(DateTime showStartDateAndStartTime) {
    emit(state.copyWith(
      showStartDateAndStartTime: showStartDateAndStartTime,
      show: state.show
          ?.copyWith(showStartDateAndStartTime: showStartDateAndStartTime),
    ));
  }

  /// Monitors the Show date and end time
  void showEndDateAndEndTimeChanged(DateTime showEndDateAndEndTime) {
    emit(state.copyWith(
      showEndDateAndEndTime: showEndDateAndEndTime,
      show: state.show?.copyWith(showEndDateAndEndTime: showEndDateAndEndTime),
    ));
  }

  /// Monitors the region number
  void regionNumberChanged(int regionNumber) {
    // check to see if the
    emit(state.copyWith(
      regionNumber: regionNumber,
      show: state.show?.copyWith(regionNumber: regionNumber),
    ));
  }

  /// Monitors the license number
  void licenseNumberChanged(String licenseNumber) {
    //check to see if {lisenceNumber} contains  a non numeric value
    // throw an error if it does
    if (licenseNumber.contains(RegExp(r'[a-zA-Z]'))) {
      error('License number must be a number');
      return;
    } else {
      final licenseNumberInt = int.tryParse(licenseNumber);

      emit(state.copyWith(
        licenseNumber: licenseNumberInt,
        show: state.show
            ?.copyWith(showLicenseNumber: int.tryParse(licenseNumber)),
      ));
      if (licenseNumber.isNotEmpty) {
        emit(state.copyWith(isLicenseNeeded: false));
      }
    }
  }

  /// Monitors the judges
  void judgesChanged({required List<Official> judges}) {
    emit(state.copyWith(
      judges: judges,
    ));
  }

  /// Monitors the show organizers
  void showOrganizersChanged({required List<Official> showOrganizers}) {
    emit(state.copyWith(
      showOrganizers: showOrganizers,
    ));
  }

  /// Monitors the gate steward
  void gateStewardChanged(Official? gateSteward) {
    emit(state.copyWith(
      gateSteward: gateSteward,
    ));
  }

  /// Monitors the show secretary
  void showSecretaryChanged(Official? showSecretary) {
    emit(state.copyWith(
      showSecretary: showSecretary,
    ));
  }

  ///Monitors the technical delegates
  void technicalDelegatesChanged({required List<Official> technicalDelegates}) {
    emit(state.copyWith(
      technicalDelegates: technicalDelegates,
    ));
  }

  /// Monitors the other officials
  void otherOfficialsChanged({required List<Official> otherOfficials}) {
    emit(state.copyWith(
      otherOfficials: otherOfficials,
    ));
  }

  /// Add an official to the list
  void addOfficial(Official official) {
    switch (official.role) {
      case OfficialRole.Judge:
        if (!state.judges.any((j) => j.id == official.id)) {
          final updatedJudges = [...state.judges, official];
          judgesChanged(judges: updatedJudges.toSet().toList());
        }
        break;
      case OfficialRole.TechnicalDelegate:
        if (!state.technicalDelegates.any((td) => td.id == official.id)) {
          final updatedTechnicalDelegates = [
            ...state.technicalDelegates,
            official
          ];
          technicalDelegatesChanged(
              technicalDelegates: updatedTechnicalDelegates.toSet().toList());
        }
        break;
      case OfficialRole.ShowSecretary:
        if (state.showSecretary == null) {
          showSecretaryChanged(official);
        }
        break;
      case OfficialRole.GateSteward:
        if (state.gateSteward == null) {
          gateStewardChanged(official);
        }
        break;
      case OfficialRole.ShowManager:
        if (!state.showOrganizers.any((o) => o.id == official.id)) {
          final updatedShowOrganizers = [...state.showOrganizers, official];
          showOrganizersChanged(
              showOrganizers: updatedShowOrganizers.toSet().toList());
        }
        break;
      case OfficialRole.Other:
        if (!state.otherOfficials.any((o) => o.id == official.id)) {
          final updatedOtherOfficials = [...state.otherOfficials, official];
          otherOfficialsChanged(
              otherOfficials: updatedOtherOfficials.toSet().toList());
        }
        break;
      default:
        error("Unknown role for official");
    }
  }

  void removeOfficial(Official official) {
    if (state.show != null) {
      final show = state.show!;
      switch (official.role) {
        case OfficialRole.Judge:
          // Remove the official from the state
          final updatedJudges =
              state.judges.where((j) => j.id != official.id).toList();
          judgesChanged(judges: updatedJudges);

          // Persist the removal in the database
          show.judges.removeWhere((j) => j.id == official.id);
          break;

        case OfficialRole.ShowManager:
          // Remove the official from the state
          final updatedShowOrganizers =
              state.showOrganizers.where((o) => o.id != official.id).toList();
          showOrganizersChanged(showOrganizers: updatedShowOrganizers);

          // Persist the removal in the database
          show.showOrganizers.removeWhere((o) => o.id == official.id);
          break;

        case OfficialRole.GateSteward:
          // Remove the official from the state
          gateStewardChanged(null);
          // Persist the removal in the database
          show.gateSteward.target = null;
          break;

        case OfficialRole.ShowSecretary:
          // Remove the official from the state
          showSecretaryChanged(null);
          // Persist the removal in the database
          show.showSecretary.target = null;
          break;

        case OfficialRole.TechnicalDelegate:
          // Remove the official from the state
          final updatedTechnicalDelegates = state.technicalDelegates
              .where((td) => td.id != official.id)
              .toList();
          technicalDelegatesChanged(
              technicalDelegates: updatedTechnicalDelegates);

          // Persist the removal in the database
          show.technicalDelegates.removeWhere((td) => td.id == official.id);
          break;

        case OfficialRole.Other:
          // Remove the official from the state
          final updatedOtherOfficials =
              state.otherOfficials.where((o) => o.id != official.id).toList();
          otherOfficialsChanged(otherOfficials: updatedOtherOfficials);

          // Persist the removal in the database
          show.otherOfficials.removeWhere((o) => o.id == official.id);
          break;

        default:
          error("Unknown role for official");
      }

      // Save the updated show to the database
      objectBox.updateShow(show);
    } else {
      error("Cannot remove official because no show is associated.");
    }
  }

  /// Monitors the license number requirement
  void licenseNeededChanged(bool isLicenseNeeded) {
    emit(state.copyWith(isLicenseNeeded: isLicenseNeeded));
  }

  /// Finalize the show and set it as a draft
  void finalizeShow() {
    if (state.show != null) {
      final updatedShow = state.show!.copyWith(isDraft: false);
      objectBox.updateShow(
          updatedShow); // Persist the finalized show to the database
      emit(state.copyWith(show: updatedShow)); // Update the state
    } else {
      debugPrint('Error: Show is null when finalizing.');
      error('Error: Show is null when finalizing');
    }
  }

  ObjectBox get box => objectBox;

  /// Sets an error
  void error(String message) {
    emit(state.copyWith(errorMessage: message, isError: true));
  }

  /// clear error
  void clearError() {
    emit(state.copyWith(errorMessage: null, isError: false));
  }
}
