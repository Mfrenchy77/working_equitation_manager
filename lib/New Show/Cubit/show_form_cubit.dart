import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';

part 'show_form_state.dart';

class ShowFormCubit extends Cubit<ShowFormState> {
  Show? currentShow;
  int? currentShowId;
  final ObjectBox objectBox;

  ShowFormCubit({
    Show? draftShow,
    required this.objectBox,
  }) : super(const ShowFormInitial()) {
    if (draftShow != null) {
      currentShow = draftShow;
      emit(ShowFormTypeSelected(draftShow));
    }
  }

  /// Set the show type and create an initial draft entry in the database
  void setShowType(ShowType showType) {
    if (currentShow == null) {
      currentShow = Show(
        showType: showType,
      );
      currentShowId = objectBox.addShow(currentShow!);
    } else {
      currentShow = currentShow!.copyWith(showType: showType);
      objectBox.updateShow(currentShow!);
    }

    emit(ShowFormTypeSelected(currentShow!));
  }

  /// Update the draft entry as the user proceeds
  void updateShowDetails({String? competitionName, String? showDate}) {
    if (state.show != null && currentShowId != null) {
      final updatedShow = state.show!.copyWith(
        competitionName: competitionName ?? state.show!.competitionName,
        showDateAndStartTime: showDate ?? state.show!.showDateAndStartTime,
      );

      // Update in the database
      objectBox.updateShow(updatedShow);

      // Emit new state with updated Show object
      emit(ShowFormNextStep(updatedShow));
    }
  }

  /// Finalize the show setup
  void finalizeShow() {
    if (state.show != null && currentShowId != null) {
      final updatedShow = state.show!.copyWith(isDraft: false);

      // Update in the database
      objectBox.updateShow(updatedShow);

      // Emit state indicating completion if needed
      emit(ShowFormNextStep(updatedShow));
    }
  }
}
