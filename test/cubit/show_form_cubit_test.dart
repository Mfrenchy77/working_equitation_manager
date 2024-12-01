import 'package:flutter_test/flutter_test.dart';
import 'package:working_equitation_manager/Database/objectbox.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';

// Mock class for ObjectBox
class MockObjectBox extends Mock implements ObjectBox {}

// Fake class for Show (registerFallbackValue requires a fake)
class FakeShow extends Fake implements Show {}

void main() {
  setUpAll(() {
    // Register a fallback value for Show
    registerFallbackValue(FakeShow());
  });

  group('ShowFormCubit', () {
    late MockObjectBox mockObjectBox;

    // Setup mock before each test
    setUp(() {
      mockObjectBox = MockObjectBox();
    });

    test('emits [ShowFormTypeSelected] when setShowType is called', () {
      // Arrange: Create the cubit with the mocked ObjectBox
      final cubit = ShowFormCubit(objectBox: mockObjectBox);

      // Mock the behavior of addShow
      when(() => mockObjectBox.addShow(any())).thenReturn(1);

      // Act: Call the method to set show type to Licensed
      cubit.setShowType(ShowType.Licensed);

      // Assert: Check that the state is of type ShowFormTypeSelected and the show type is correct
      expect(cubit.state, isA<ShowFormTypeSelected>());
      expect((cubit.state as ShowFormTypeSelected).show!.showTypeString, 'Licensed');
    });
  });
}
