class Film {
  final String title;
  final int episodeID;
  final String director;
  final String releaseDate;
  final String created;
  final String openingCrawl;

  Film(
      {required this.title,
      required this.episodeID,
      required this.director,
      required this.releaseDate,
      required this.created,
      required this.openingCrawl});

  factory Film.fromMap(Map<String, dynamic> map) {
    return Film(
      title: map['title'],
      episodeID: map['episodeID'],
      director: map['director'],
      releaseDate: map['releaseDate'],
      created: map['created'],
      openingCrawl: map['openingCrawl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'episodeID': episodeID,
      'director': director,
      'releaseDate': releaseDate,
      'created': created,
      'openingCrawl': openingCrawl,
    };
  }
}
