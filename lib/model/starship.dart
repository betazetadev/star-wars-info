class Starship {
  int? mglt;
  double cargoCapacity;
  String consumables;
  double costInCredits;
  String crew;
  String id;
  double length;
  List<String> manufacturers;
  int? maxAtmospheringSpeed;
  String model;
  String name;
  String passengers;
  String starshipClass;

  Starship({
    required this.mglt,
    required this.cargoCapacity,
    required this.consumables,
    required this.costInCredits,
    required this.crew,
    required this.id,
    required this.length,
    required this.manufacturers,
    required this.maxAtmospheringSpeed,
    required this.model,
    required this.name,
    required this.passengers,
    required this.starshipClass,
  });

  factory Starship.fromMap(Map<String, dynamic> map) {
    return Starship(
      mglt: map['MGLT'] ?? 0,
      cargoCapacity: double.parse(map['cargoCapacity']?.toString() ?? '0'),
      consumables: map['consumables'],
      costInCredits: double.parse(map['costInCredits']?.toString() ?? '0'),
      crew: map['crew'],
      id: map['id'] ?? '',
      length: double.parse(map['length'].toString()),
      manufacturers: List<String>.from(map['manufacturers']),
      maxAtmospheringSpeed: map['maxAtmospheringSpeed'],
      model: map['model'],
      name: map['name'],
      passengers: map['passengers'],
      starshipClass: map['starshipClass'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'MGLT': mglt,
      'cargoCapacity': cargoCapacity,
      'consumables': consumables,
      'costInCredits': costInCredits,
      'crew': crew,
      'id': id,
      'length': length,
      'manufacturers': manufacturers,
      'maxAtmospheringSpeed': maxAtmospheringSpeed,
      'model': model,
      'name': name,
      'passengers': passengers,
      'starshipClass': starshipClass,
    };
  }
}