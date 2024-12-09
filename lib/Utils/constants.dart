class Constants {
  /// The list of states in the USA.
  static const List<String> states = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'District of Columbia',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];

  /// The Regions in the USAWE.
  static const Map<int, String> regionConstants = {
    1: "Alaska, Washington, Oregon, Idaho, and Montana",
    2: "California, Nevada, Utah, Arizona, Hawaii, and U.S. territories in the Pacific",
    3: "Wyoming, North Dakota, South Dakota, Nebraska, Kansas, and Colorado",
    4: "New Mexico, Texas, Oklahoma, Arkansas, and Louisiana",
    5: "Minnesota, Iowa, Missouri, Wisconsin, Illinois, Michigan, Indiana, Ohio, and Kentucky",
    6: "New York, Vermont, New Hampshire, Maine, Massachusetts, Rhode Island, Connecticut, New Jersey, Pennsylvania, Delaware, Maryland, West Virginia, Virginia, and the District of Columbia",
    7: "Tennessee, Mississippi, Alabama, North Carolina, South Carolina, Georgia, Florida, and US territories in the Atlantic",
    0: "International: All locations outside the United States of America",
  };

  /// The list of levels offered at a show.
  /// L1- Introductory, L2- Novice A, L3- Novice B, L4- Intermediate A,
  /// L5- Intermediate B, L6- Advanced A, L7- Masters.
  static const List<String> levels = [
    'L1',
    'L2',
    'L3',
    'L4',
    'L5',
    'L6',
    'L7',
  ];

  /// The Division options for a competitor.
  static const List<String> divisions = [
    'Open',
    'Amateur',
    'Youth',
  ];

  /// The email address for notifying the USAWE of a new show.
  static const String usaweEmailAdress = 'GIRA@usawe.org';
}
