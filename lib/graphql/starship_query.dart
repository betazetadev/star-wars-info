String getAllStarships = r'''
  query Starships {
    allStarships {
      starships {
        MGLT
        cargoCapacity
        consumables
        costInCredits
        crew
        length
        manufacturers
        maxAtmospheringSpeed
        model
        name
        passengers
        starshipClass
      }
    }
  }
''';
