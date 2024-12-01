import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Show> showBox;

  ObjectBox._create(this.store) {
    showBox = Box<Show>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  ///Add a show to the database
  int addShow(Show show) {
    return showBox.put(show);
  }

  /// Get all shows from the database
  List<Show> getAllShows() {
    return showBox.getAll();
  }

  /// Get a show by its id
  Show? getShowById(int id) {
    return showBox.get(id);
  }

  /// Update a show in the database
  void updateShow(Show show) {
    showBox.put(show);
  }

  /// Delete a show from the database
  void deleteShow(int id) {
    showBox.remove(id);
  }
}
