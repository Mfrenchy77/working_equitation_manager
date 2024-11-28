import 'package:working_equitation_manager/Models/movement.dart';


class EaseOfHandlingTrial {
  late int id;

  late int level;
  int? finalScore;
  late int numberOfObstacles;
  late List<Movement> obstacles;
  late List<Movement> collectives;
}

//   EaseOfHandlingTrial({
//     this.finalScore,
//     required this.level,
//     required this.obstacles,
//     required this.collectives,
//     required this.numberOfObstacles,
//   });

//   EaseOfHandlingTrial copyWith({
//     int? level,
//     int? finalScore,
//     int? numberOfObstacles,
//     List<Movement>? obstacles,
//     List<Movement>? collectives,
//   }) {
//     return EaseOfHandlingTrial(
//       level: level ?? this.level,
//       obstacles: obstacles ?? this.obstacles,
//       finalScore: finalScore ?? this.finalScore,
//       collectives: collectives ?? this.collectives,
//       numberOfObstacles: numberOfObstacles ?? this.numberOfObstacles,
//     );
//   }

//   // total score equals sum of obstacle scores
//   // plus the sum of collective scores - deductions
//   // divided by (number of obstacles * 10 + 70)
//   double get totalScore {
//     int total = 0;
//     for (var obstacle in obstacles) {
//       total += obstacle.score! * obstacle.coefficient;
//     }
//     for (var collective in collectives) {
//       total += collective.score! * collective.coeffi
//   EaseOfHandlingTrial({
//     this.finalScore,
//     total = (total * 100) ~/ (numberOfObstacles * 10 + 70);
//     return total as double;
//   }

//   //toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'level': level,
//       'finalScore': finalScore,
//       'numberOfObstacles': numberOfObstacles,
//       'obstacles': obstacles.map((x) => x.toMap()).toList(),
//       'collectives': collectives.map((x) => x.toMap()).toList(),
//     };
//   }

//   //fromMap
//   factory EaseOfHandlingTrial.fromMap(Map<String, dynamic> map) {
//     return EaseOfHandlingTrial(
//       level: map['level'],
//       finalScore: map['finalScore'],
//       numberOfObstacles: map['numberOfObstacles'],
//       obstacles: List<Movement>.from(
//           map['obstacles']?.map((x) => Movement.fromMap(x))),
//       collectives: List<Movement>.from(
//           map['collectives']?.map((x) => Movement.fromMap(x))),
//     );
//   }
// }
