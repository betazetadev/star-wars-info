String getAllVehicles = r'''
  query Vehicles {
    allVehicles {
      vehicles {
        cargoCapacity
        consumables
        costInCredits
        crew
        id
        length
        manufacturers
        model
        maxAtmospheringSpeed
        name
        passengers
        vehicleClass
      }
    }
  }
''';