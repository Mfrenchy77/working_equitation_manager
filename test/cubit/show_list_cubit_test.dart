import 'package:flutter_test/flutter_test.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/Home/show_list_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:objectbox/objectbox.dart'; // Import the Box class

// Mock class for ObjectBox
class MockObjectBox extends Mock implements ObjectBox {}

// Mock class for Box<Show>
class MockShowBox extends Mock implements Box<Show> {}

class FakeShow extends Fake implements Show {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeShow());
  });

  group('ShowListCubit', () {
    late MockObjectBox mockObjectBox;
    late MockShowBox mockShowBox;

    setUp(() {
      mockObjectBox = MockObjectBox();
      mockShowBox = MockShowBox();

      // When mockObjectBox.showBox is accessed, return the mockShowBox
      when(() => mockObjectBox.showBox).thenReturn(mockShowBox);
    });

    test('loadShows emits shows from ObjectBox', () async {
      // Arrange
      final cubit = ShowListCubit(mockObjectBox);
      final showList = [FakeShow()];

      // Set up the expected behavior for mockShowBox.getAll()
      when(() => mockShowBox.getAll()).thenReturn(showList);

      // Act
      cubit.loadShows();

      // Assert
      expect(cubit.state, showList);
    });

    test('addShow adds a show and reloads the shows', () async {
      // Arrange
      final cubit = ShowListCubit(mockObjectBox);
      final newShow = FakeShow();
      final updatedShowList = [newShow];

      // Set up the expected behavior for mockShowBox.put()
      when(() => mockShowBox.put(any())).thenReturn(1);
      // Set up the expected behavior for mockShowBox.getAll()
      when(() => mockShowBox.getAll()).thenReturn(updatedShowList);

      // Act
      cubit.addShow(newShow);

      // Assert
      expect(cubit.state, updatedShowList);
    });

    test('deleteShow removes a show and reloads the shows', () async {
      // Arrange
      final cubit = ShowListCubit(mockObjectBox);
      final showId = 1;
      final updatedShowList = <Show>[];

      // Set up the expected behavior for mockShowBox.remove()
      when(() => mockShowBox.remove(any())).thenReturn(true);
      // Set up the expected behavior for mockShowBox.getAll()
      when(() => mockShowBox.getAll()).thenReturn(updatedShowList);

      // Act
      cubit.deleteShow(showId);

      // Assert
      expect(cubit.state, updatedShowList);
    });
  });
}
