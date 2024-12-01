// ignore: constant_identifier_names
enum Division { Open, Amateur, Youth }

extension DivisionExtension on Division {
  String get name {
    switch (this) {
      case Division.Open:
        return 'Open';
      case Division.Amateur:
        return 'Amateur';
      case Division.Youth:
        return 'Youth';
    }
  }

  static Division fromString(String division) {
    switch (division) {
      case 'Open':
        return Division.Open;
      case 'Amateur':
        return Division.Amateur;
      case 'Youth':
        return Division.Youth;
      default:
        throw ArgumentError('Invalid division: $division');
    }
  }
}
