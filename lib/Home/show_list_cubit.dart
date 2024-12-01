import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';

class ShowListCubit extends Cubit<List<Show>> {
  final ObjectBox objectBox;
  ShowListCubit(this.objectBox) : super([]);

  void loadShows() {
    final shows = objectBox.showBox.getAll();
    emit(shows);
  }

  void addShow(Show newShow) {
    objectBox.showBox.put(newShow);
    loadShows();
  }

  void deleteShow(int id) {
    objectBox.showBox.remove(id);
    loadShows();
  }
}
