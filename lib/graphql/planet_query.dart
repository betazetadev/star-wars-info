String getAllPlanets = r'''
  query AllPlanets {
    allPlanets {
      planets {
        climates
        created
        diameter
        gravity
        id
        name
        orbitalPeriod
        population
        rotationPeriod
        surfaceWater
        terrains
      }
    }
  }
''';