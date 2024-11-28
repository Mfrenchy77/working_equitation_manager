class Show {
  /// The unique identifier for the show.
  int? id;

  /// The Region number of the show.
  int regionNumber;

  /// The license number of the show.
  int showLicenseNumber;

  /// The name of the show.
  String competitionName;

  /// The facuility name and address of the show.
  String facuilityNameandAddress;

  /// The date of the show and start time including time zone.
  String showDateAndStartTime;

  ///provide the names and email addresses of up to two (2) people you’d like to
  ///have set up as GIRA organizers to be authorized to set up, score, print results, and download the
  ///show results excel file(s)
  List<String> showOrganizers;

  Show({
    this.id,
    required this.regionNumber,
    required this.showLicenseNumber,
    required this.competitionName,
    required this.facuilityNameandAddress,
    required this.showDateAndStartTime,
    required this.showOrganizers,
  });

  //copywith
  Show copyWith({
    int? id,
    int? regionNumber,
    int? showLicenseNumber,
    String? competitionName,
    String? facuilityNameandAddress,
    String? showDateAndStartTime,
    List<String>? showOrganizers,
  }) {
    return Show(
      id: id ?? this.id,
      regionNumber: regionNumber ?? this.regionNumber,
      showLicenseNumber: showLicenseNumber ?? this.showLicenseNumber,
      competitionName: competitionName ?? this.competitionName,
      facuilityNameandAddress:
          facuilityNameandAddress ?? this.facuilityNameandAddress,
      showDateAndStartTime: showDateAndStartTime ?? this.showDateAndStartTime,
      showOrganizers: showOrganizers ?? this.showOrganizers,
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'regionNumber': regionNumber,
      'showLicenseNumber': showLicenseNumber,
      'competitionName': competitionName,
      'facuilityNameandAddress': facuilityNameandAddress,
      'showDateAndStartTime': showDateAndStartTime,
      'showOrganizers': showOrganizers,
    };
  }

  //from map
  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      id: map['id'],
      regionNumber: map['regionNumber'],
      showLicenseNumber: map['showLicenseNumber'],
      competitionName: map['competitionName'],
      facuilityNameandAddress: map['facuilityNameandAddress'],
      showDateAndStartTime: map['showDateAndStartTime'],
      showOrganizers: List<String>.from(map['showOrganizers']),
    );
  }
}
