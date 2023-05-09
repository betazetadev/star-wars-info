class Person {
  final String gender;
  final int height;
  final String name;
  final String birthYear;
  final String eyeColor;

  Person({
    required this.gender,
    required this.height,
    required this.name,
    required this.birthYear,
    required this.eyeColor,
  });

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      gender: map['gender'],
      height: map['height'],
      name: map['name'],
      birthYear: map['birthYear'],
      eyeColor: map['eyeColor'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'height': height,
      'name': name,
      'birthYear': birthYear,
      'eyeColor': eyeColor,
    };
  }
}
