import 'package:objectbox/objectbox.dart';

/// Class the represents a movement in the Dressage Trial
/// & Ease of Handling Trial

@Entity()
class Movement {
  @Id()
  int id = 0;
  int? score;
  String name;
  String? comment;
  int coefficient;

  Movement({
    this.score,
    this.comment,
    required this.name,
    this.coefficient = 1,
  });
}
// }
//   //copywith
//   Movement copyWith({
//     int? score,
//     String? name,
//     String? comment,
//     int? coefficient,
//   }) {
//     return Movement(
//       name: name ?? this.name,
//       score: score ?? this.score,
//       comment: comment ?? this.comment,
//       coefficient: coefficient ?? this.coefficient,
//     );
//   }

//   //to map
//   Map<String, dynamic> toMap() {
//     return {
//       'score': score,
//       'name': name,
//       'comment': comment,
//       'coefficient': coefficient,
//     };
//   }

//   //from map
//   factory Movement.fromMap(Map<String, dynamic> map) {
//     return Movement(
//       score: map['score'],
//       name: map['name'],
//       comment: map['comment'],
//       coefficient: map['coefficient'],
//     );
//   }
// }
