class Planet {
  List<String> climates;
  String created;
  int? diameter;
  String gravity;
  String id;
  String name;
  int? orbitalPeriod;
  double? population;
  int? rotationPeriod;
  double? surfaceWater;
  List<String> terrains;

  Planet({
    required this.climates,
    required this.created,
    required this.diameter,
    required this.gravity,
    required this.id,
    required this.name,
    required this.orbitalPeriod,
    required this.population,
    required this.rotationPeriod,
    required this.surfaceWater,
    required this.terrains,
  });

  Map<String, dynamic> toMap() {
    return {
      'climates': climates,
      'created': created,
      'diameter': diameter,
      'gravity': gravity,
      'id': id,
      'name': name,
      'orbitalPeriod': orbitalPeriod,
      'population': population,
      'rotationPeriod': rotationPeriod,
      'surfaceWater': surfaceWater,
      'terrains': terrains,
    };
  }

  static Planet fromMap(Map<String, dynamic> map) {
    return Planet(
      climates: List<String>.from(map['climates']),
      created: map['created'],
      diameter: map['diameter'] ?? 0,
      gravity: map['gravity'],
      id: map['id'],
      name: map['name'],
      orbitalPeriod: map['orbitalPeriod'] ?? 0,
      population: double.parse(map['population']?.toString() ?? '0'),
      rotationPeriod: map['rotationPeriod'] ?? 0,
      surfaceWater: double.parse(map['surfaceWater']?.toString() ?? '0'),
      terrains: List<String>.from(map['terrains']),
    );
  }
}
