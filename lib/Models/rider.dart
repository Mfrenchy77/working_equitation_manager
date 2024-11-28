import 'package:working_equitation_manager/Models/cow_trial.dart';
import 'package:working_equitation_manager/Models/dressage_trial.dart';
import 'package:working_equitation_manager/Models/ease_of_handling_trial.dart';
import 'package:working_equitation_manager/Models/horse.dart';
import 'package:working_equitation_manager/Models/speed_trial.dart';



class Rider {
  late int id;

  int? showId;
   Horse? horse; 
  late int level;
  late String name; 
  late String usaweId;
   CowTrial? cowTrial;  
  late String division;
  SpeedTrial? speedTrial;  
  DressageTrial? dressageTrial;  
  EaseOfHandlingTrial? easeOfHandlingTrial;  
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
