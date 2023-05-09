String getAllPeople = r'''
  query getAllPeople {
    allPeople {
      people {
        name
        gender
        height
        birthYear
        eyeColor
      }
    }
  }
''';