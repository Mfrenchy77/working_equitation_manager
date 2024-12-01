import 'package:objectbox/objectbox.dart';

@Entity()
class CowTrial {
  @Id()
  int id = 0;
  int penalties;
  int finalSpeed;
  int initialSpeed;

  CowTrial({
    this.penalties = 0,
    this.finalSpeed = 0,
    this.initialSpeed = 0,
  });
}

//   CowTrial({
//     required this.penalties,
//     required this.finalSpeed,
//     required this.initialSpeed,
//   });

//   CowTrial copyWith({
//     int? penalties,
//     int? finalSpeed,
//     int? initialSpeed,
//   }) {
//     return CowTrial(
//       penalties: penalties ?? this.penalties,
//       finalSpeed: finalSpeed ?? this.finalSpeed,
//       initialSpeed: initialSpeed ?? this.initialSpeed,
//     );
//   }

//   //toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'penalties': penalties,
//       'finalSpeed': finalSpeed,
//       'initialSpeed': initialSpeed,
//     };
//   }

//   //fromMap
//   factory CowTrial.fromMap(Map<String, dynamic> map) {
//     return CowTrial(
//       penalties: map['penalties'],
//       finalSpeed: map['finalSpeed'],
//       initialSpeed: map['initialSpeed'],
//     );
//   }
// }
