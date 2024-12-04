import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';

class ShowListCubit extends Cubit<List<Show>> {
  final ObjectBox objectBox;
  late final Stream<List<Show>> _showStream;
  StreamSubscription<List<Show>>? _streamSubscription;

  ShowListCubit(this.objectBox) : super([]) {
    _initializeShowStream();
  }

  void _initializeShowStream() {
    final queryBuilder = objectBox.showBox.query();
    _showStream = queryBuilder
        .watch(triggerImmediately: true)
        .map((query) => query.find());

    _streamSubscription = _showStream.listen((shows) {
      emit(shows);
    });
  }

  void addShow(Show newShow) {
    objectBox.showBox.put(newShow);
  }

  void deleteShow(int id) {
    objectBox.showBox.remove(id);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
