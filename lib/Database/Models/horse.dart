import 'package:objectbox/objectbox.dart';

@Entity()
class Horse {
  @Id()
  int id = 0;

  int usaweId;
  String name;

  Horse({
    required this.name,
    required this.usaweId,
  });
}

//   Horse copyWith({
//     String? name,
//     int? usaweId,
//   }) {
//     return Horse(
//       name: name ?? this.name,
//       usaweId: usaweId ?? this.usaweId,
//     );
//   }

//   //toMap
//   Map<String, dynamic> toMap() {
//     return {
//       'usaweId': usaweId,
//       'name': name,
//     };
//   }

//   //fromMap
//   factory Horse.fromMap(Map<String, dynamic> map) {
//     return Horse(
//       name: map['name'],
//       usaweId: map['usaweId'],
//     );
//   }
// }
