import 'package:working_equitation_manager/Database/Models/rider.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/objectbox.g.dart';

@Entity()
class Show {
  /// The unique identifier for the show.
  @Id()
  int? id = 0;

  /// Set the Draft status of the show.
  bool isDraft;

  /// The show's ShowType stored as a string.
  String? showTypeString;

  /// The Region number of the show.
  int? regionNumber;

  /// The license number of the show.
  int? showLicenseNumber;

  /// The name of the show.
  String? competitionName;

  /// The date of the show and start time including time zone.
  String? showDateAndStartTime;

  /// The facility name and address of the show.
  String? facuilityNameandAddress;

  /// Provide the names and email addresses of up to two (2) people you’d like to
  /// have set up as GIRA organizers to be authorized to set up, score, print results, and download the
  /// show results excel file(s)
  List<String>? showOrganizers;

  final riders = ToMany<Rider>();

  Show({
    this.id,
    ShowType? showType,
    this.regionNumber,
    this.isDraft = true,
    this.showOrganizers,
    this.competitionName,
    this.showLicenseNumber,
    this.showDateAndStartTime,
    this.facuilityNameandAddress,
  }) : showTypeString = showType?.name;

  // Copy with method
  Show copyWith({
    int? id,
    bool? isDraft,
    ShowType? showType,
    int? regionNumber,
    int? showLicenseNumber,
    String? competitionName,
    List<String>? showOrganizers,
    String? showDateAndStartTime,
    String? facuilityNameandAddress,
  }) {
    return Show(
      id: id ?? this.id,
      isDraft: isDraft ?? this.isDraft,
      showType: showType ?? this.showType,
      regionNumber: regionNumber ?? this.regionNumber,
      showOrganizers: showOrganizers ?? this.showOrganizers,
      competitionName: competitionName ?? this.competitionName,
      showLicenseNumber: showLicenseNumber ?? this.showLicenseNumber,
      showDateAndStartTime: showDateAndStartTime ?? this.showDateAndStartTime,
      facuilityNameandAddress:
          facuilityNameandAddress ?? this.facuilityNameandAddress,
    );
  }

  // Getter and setter to convert the String back to ShowType
  ShowType? get showType => showTypeString != null
      ? ShowType.values.firstWhere(
          (e) => e.name == showTypeString,
          orElse: () => ShowType.Schooling,
        )
      : null;

  set showType(ShowType? showType) {
    showTypeString = showType?.name;
  }
}




//   //copywith
//   Show copyWith({
//     int? id,
//     int? regionNumber,
//     int? showLicenseNumber,
//     String? competitionName,
//     String? facuilityNameandAddress,
//     String? showDateAndStartTime,
//     List<String>? showOrganizers,
//   }) {
//     return Show(
//       id: id ?? this.id,
//       regionNumber: regionNumber ?? this.regionNumber,
//       showLicenseNumber: showLicenseNumber ?? this.showLicenseNumber,
//       competitionName: competitionName ?? this.competitionName,
//       facuilityNameandAddress:
//           facuilityNameandAddress ?? this.facuilityNameandAddress,
//       showDateAndStartTime: showDateAndStartTime ?? this.showDateAndStartTime,
//       showOrganizers: showOrganizers ?? this.showOrganizers,
//     );
//   }

//   //to map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'regionNumber': regionNumber,
//       'showLicenseNumber': showLicenseNumber,
//       'competitionName': competitionName,
//       'facuilityNameandAddress': facuilityNameandAddress,
//       'showDateAndStartTime': showDateAndStartTime,
//       'showOrganizers': showOrganizers,
//     };
//   }

//   //from map
//   factory Show.fromMap(Map<String, dynamic> map) {
//     return Show(
//       id: map['id'],
//       regionNumber: map['regionNumber'],
//       showLicenseNumber: map['showLicenseNumber'],
//       competitionName: map['competitionName'],
//       facuilityNameandAddress: map['facuilityNameandAddress'],
//       showDateAndStartTime: map['showDateAndStartTime'],
//       showOrganizers: List<String>.from(map['showOrganizers']),
//     );
//   }
// }
