String getAllFilms = r'''
  query getAllFilms {
    allFilms {
      films {
        title
        episodeID
        director
        releaseDate
        created
        openingCrawl
      }
    }
  }
''';
