import 'package:objectbox/objectbox.dart';
import 'package:working_equitation_manager/Database/Models/movement.dart';

@Entity()
class DressageTrial {
  @Id()
  int id = 0;

  /// The level of the trial. 1-7
  int? level;

  /// Final Score of the Dressage Trial. In percentage e.g. 75.000%
  int? finalScore;

  /// The number of points deducted from the final score.
  int deductions;

  /// The number of movements in the trial.
  int numberOfMovements;

  /// The total possible points for the trial.
  int totalPossiblePoints;

  /// The list of movements in the trial.
  // @Backlink('dressageTrial')
  final movements = ToMany<Movement>();

  /// The list of collectives in the trial.
  // @Backlink('dressageTrial')
  final collectives = ToMany<Movement>();

  DressageTrial({
    this.id = 0,
    this.finalScore,
    required this.level,
    this.deductions = 0,
    required this.numberOfMovements,
    required this.totalPossiblePoints,
  });

  // DressageTrial({
  //   this.id = 0,
  //   this.finalScore,
  //   required this.level,
  //   this.deductions = 0,
  //   required this.numberOfMovements,
  //   required this.totalPossiblePoints,
  // });
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
