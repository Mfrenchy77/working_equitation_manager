import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        riders: draftShow.riders,
        showType: draftShow.showType,
        facilityName: draftShow.facilityName,
        regionNumber: draftShow.regionNumber,
        facilityAddress: draftShow.facilityAddress,
        competitionName: draftShow.competitionName,
        licenseNumber: draftShow.showLicenseNumber,
        showDateAndStartTime: draftShow.showDateAndStartTime,
      ));
    }
  }

  /// Save the current state of the show to the database
  void _saveOrUpdateShow() {
    debugPrint('Save or update show');
    if (state.show != null) {
      final show = state.show!;
      if (show.id != null && show.id! > 0) {
        // Update the existing show in the database
        debugPrint('Updating show with id: ${show.id}');
        for (var rider in state.riders!) {
          show.riders.add(rider);
        }
        objectBox.updateShow(show);
      } else {
        // Create a new show in the database

        final newShowId = objectBox.addShow(show);
        debugPrint('Created new show with id: $newShowId');
        emit(state.copyWith(show: show.copyWith(id: newShowId)));
      }
    } else {
      // Create a new show if one does not exist
      debugPrint('Database show exitst Creating new local show');

      final newShow = Show(
        showType: state.showType!,
        facilityName: state.facilityName!,
        regionNumber: state.regionNumber!,
        showLicenseNumber: state.licenseNumber,
        competitionName: state.competitionName!,
        facilityAddress: state.facilityAddress!,
        showDateAndStartTime: state.showDateAndStartTime!,
      );
      for (var rider in state.riders!) {
        newShow.riders.add(rider);
      }

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
    saveShow();
    emit(state.copyWith(currentPage: state.currentPage + 1));
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
            state.showDateAndStartTime != null;
      case 1:
        return state.showType != null;
      case 2:
        return state.show?.showType == ShowType.Schooling ||
            state.licenseNumber != null ||
            state.isLicenseNeeded;
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

  /// Monitors the facility address
  void facilityAddressChanged(String facilityAddress) {
    emit(state.copyWith(
      facilityAddress: facilityAddress,
      show: state.show?.copyWith(facilityAddress: facilityAddress),
    ));
  }

  /// Monitors the Show date and start time
  void showDateAndStartTimeChanged(DateTime showDateAndStartTime) {
    emit(state.copyWith(
      showDateAndStartTime: showDateAndStartTime,
      show: state.show?.copyWith(showDateAndStartTime: showDateAndStartTime),
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

  /// Monitors the license number requirement
  void licenseNeededChanged(bool isLicenseNeeded) {
    emit(state.copyWith(isLicenseNeeded: isLicenseNeeded));
  }

  /// Sets an error
  void error(String message) {
    emit(state.copyWith(errorMessage: message, isError: true));
  }

  /// clear error
  void clearError() {
    emit(state.copyWith(errorMessage: null, isError: false));
  }
}
