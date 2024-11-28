class SpeedTrial {
  late int bonus = 0;
  late int penalties = 0;
  late int finalSpeed;
  late int initialSpeed = 0;
}

//   SpeedTrial({
//     required this.bonus,
//     required this.penalties,
//     required this.finalSpeed,
//     required this.initialSpeed,
//   });

//   SpeedTrial copyWith({
//     int? bonus,
//     int? penalties,
//     int? finalSpeed,
//     int? initialSpeed,
//   }) {
//     return SpeedTrial(
//       bonus: bonus ?? this.bonus,
//       penalties: penalties ?? this.penalties,
//       finalSpeed: finalSpeed ?? this.finalSpeed,
//       initialSpeed: initialSpeed ?? this.initialSpeed,
//     );
//   }

//   // final speed equals initial speed plus penalties minus bonus
//   int get totalSpeed {
//     return initialSpeed + penalties - bonus;
//   }

//   //toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'bonus': bonus,
//       'penalties': penalties,
//       'finalSpeed': finalSpeed,
//       'initialSpeed': initialSpeed,
//     };
//   }

//   //fromMap
//   factory SpeedTrial.fromMap(Map<String, dynamic> map) {
//     return SpeedTrial(
//       bonus: map['bonus'],
//       penalties: map['penalties'],
//       finalSpeed: map['finalSpeed'],
//       initialSpeed: map['initialSpeed'],
//     );
//   }
// }
