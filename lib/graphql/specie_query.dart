String getAllSpecies = r'''
  query Species {
    allSpecies {
      species {
        averageHeight
        averageLifespan
        classification
        designation
        eyeColors
        hairColors
        id
        language
        name
        skinColors
      }
    }
  }
''';