import 'package:working_equitation_manager/Models/movement.dart';


class DressageTrial {
  late int id;

  late int level;
  int? finalScore;
  late int deductions = 0;
  late int numberOfMovements;
  late int totalPossiblePoints;
  late List<Movement> movements;
  late List<Movement> collectives;
}
//   DressageTrial({
//     this.finalScore,
//     required this.level,
//     this.deductions = 0,
//     required this.movements,
//     required this.collectives,
//     required this.numberOfMovements,
//     required this.totalPossiblePoints,
//   });

//   DressageTrial copyWith({
//     int? level,
//     int? finalScore,
//     int? deductions,
//     int? numberOfMovements,
//     int? totalPossiblePoints,
//     List<Movement>? movements,
//     List<Movement>? collectives,
//   }) {
//     return DressageTrial(
//       level: level ?? this.level,
//       movements: movements ?? this.movements,
//       deductions: deductions ?? this.deductions,
//       finalScore: finalScore ?? this.finalScore,
//       collectives: collectives ?? this.collectives,
//       numberOfMovements: numberOfMovements ?? this.numberOfMovements,
//       totalPossiblePoints: totalPossiblePoints ?? this.totalPossiblePoints,
//     );
//   }

//   double get totalScore {
//     int total = 0;
//     for (var movement in movements) {
//       total += movement.score! * movement.coefficient;
//     }
//     for (var collective in collectives) {
//       total += collective.score! * collective.coefficient;
//     }
//     //substract deductions
//     total -= deductions;
//     //divide by total possible points
//     total = (total * 100) ~/ totalPossiblePoints;
//     return total as double;
//   }

// //toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'level': level,
//       'deductions': deductions,
//       'finalScore': finalScore,
//       'numberOfMovements': numberOfMovements,
//       'totalPossiblePoints': totalPossiblePoints,
//       'movements': movements.map((x) => x.toMap()).toList(),
//       'collectives': collectives.map((x) => x.toMap()).toList(),
//     };
//   }

//   //fromMap
//   factory DressageTrial.fromMap(Map<String, dynamic> map) {
//     return DressageTrial(
//       level: map['level'],
//       deductions: map['deductions'],
//       finalScore: map['finalScore'],
//       numberOfMovements: map['numberOfMovements'],
//       totalPossiblePoints: map['totalPossiblePoints'],
//       movements: List<Movement>.from(map['movements']),
//       collectives: List<Movement>.from(map['collectives']),
//     );
//   }
// }
