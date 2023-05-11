import 'package:star_wars/model/planet.dart';

class Specie {
  double averageHeight;
  int averageLifespan;
  String classification;
  String designation;
  List<String>? eyeColors;
  List<String>? hairColors;
  String id;
  String language;
  String name;
  List<String>? skinColors;

  Specie({
    required this.averageHeight,
    required this.averageLifespan,
    required this.classification,
    required this.designation,
    required this.eyeColors,
    required this.hairColors,
    required this.id,
    required this.language,
    required this.name,
    required this.skinColors,
  });

  factory Specie.fromMap(Map<String, dynamic> map) {
    return Specie(
      averageHeight: double.parse(map['averageHeight']?.toString() ?? '0'),
      averageLifespan: map['averageLifespan'] ?? 0,
      classification: map['classification'],
      designation: map['designation'],
      eyeColors: List<String>.from(map['eyeColors']),
      hairColors: List<String>.from(map['hairColors']),
      id: map['id'],
      language: map['language'],
      name: map['name'],
      skinColors: List<String>.from(map['skinColors']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'averageHeight': averageHeight,
      'averageLifespan': averageLifespan,
      'classification': classification,
      'designation': designation,
      'eyeColors': eyeColors,
      'hairColors': hairColors,
      'id': id,
      'language': language,
      'name': name,
      'skinColors': skinColors,
    };
  }
}
