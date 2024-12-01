import 'package:objectbox/objectbox.dart';
import 'package:working_equitation_manager/Database/Models/cow_trial.dart';
import 'package:working_equitation_manager/Database/Models/dressage_trial.dart';
import 'package:working_equitation_manager/Database/Models/ease_of_handling_trial.dart';
import 'package:working_equitation_manager/Database/Models/horse.dart';
import 'package:working_equitation_manager/Database/Models/speed_trial.dart';

@Entity()
class Rider {
  @Id()
  int id = 0;

  /// This is the id issued to the rider at the show.
  // int showId;

  /// This is the level of the rider. 1-7
  int level;

  ///The first and last name of the rider.
  String name;

  ///The USAWE id of the rider.
  String usaweId;

  ///The division the rider is competing in. Open/Amateur/Youth
  String division;

  /// The horse the rider is riding.
  final horse = ToOne<Horse>();

  /// The Speed Trial for the rider.
  final speedTrial = ToOne<SpeedTrial>();

  /// The Cow Trial for the rider.
  final cowTrial = ToOne<CowTrial>();

  /// The Dressage Trial for the rider.
  final dressageTrial = ToOne<DressageTrial>();

  /// The Ease of Handling Trial for the rider.
  final easeOfHandlingTrial = ToOne<EaseOfHandlingTrial>();

  Rider({
    required this.level,
    required this.name,
    // required this.showId,
    required this.usaweId,
    required this.division,
  });
}

//   Rider({
//     this.cowTrial,
//     this.speedTrial,
//     required this.name,
//     required this.horse,
//     required this.level,
//     required this.showId,
//     required this.usaweId,
//     required this.division,
//     required this.dressageTrial,
//     required this.easeOfHandlingTrial,
//   });

//   Rider copyWith({
//     int? level,
//     int? showId,
//     String? name,
//     Horse? horse,
//     int? usaweId,
//     Division? division,
//     CowTrial? cowTrial,
//     SpeedTrial? speedTrial,
//     DressageTrial? dressageTrial,
//     EaseOfHandlingTrial? easeOfHandlingTrial,
//   }) {
//     return Rider(
//       name: name ?? this.name,
//       horse: horse ?? this.horse,
//       level: level ?? this.level,
//       showId: showId ?? this.showId,
//       usaweId: usaweId ?? this.usaweId,
//       division: division ?? this.division,
//       cowTrial: cowTrial ?? this.cowTrial,
//       speedTrial: speedTrial ?? this.speedTrial,
//       dressageTrial: dressageTrial ?? this.dressageTrial,
//       easeOfHandlingTrial: easeOfHandlingTrial ?? this.easeOfHandlingTrial,
//     );
//   }

//   // toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'level': level,
//       'showId': showId,
//       'usaweId': usaweId,
//       'name': name,
//       'horse': horse.toMap(),
//       'division': division.name,
//       'cowTrial': cowTrial?.toMap(),
//       'speedTrial': speedTrial?.toMap(),
//       'dressageTrial': dressageTrial.toMap(),
//       'easeOfHandlingTrial': easeOfHandlingTrial.toMap(),
//     };
//   }

//   // fromMap
//   factory Rider.fromMap(Map<String, dynamic> map) {
//     return Rider(
//       level: map['level'],
//       showId: map['showId'],
//       usaweId: map['usaweId'],
//       name: map['name'],
//       horse: Horse.fromMap(map['horse']),
//       division: DivisionExtension.fromString(map['division']),
//       cowTrial: map['cowTrial'] != null
//           ? CowTrial.fromMap(map['cowTrial'])
//           : null,
//       speedTrial: map['speedTrial'] != null
//           ? SpeedTrial.fromMap(map['speedTrial'])
//           : null,
//       dressageTrial: DressageTrial.fromMap(map['dressageTrial']),
//       easeOfHandlingTrial:
//           EaseOfHandlingTrial.fromMap(map['easeOfHandlingTrial']),
//     );
//   }
// }
