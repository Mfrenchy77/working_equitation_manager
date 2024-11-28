

class Horse {
  late int id;

  late String name;
  late int usaweId;
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
