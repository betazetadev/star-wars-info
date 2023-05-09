import 'package:flutter/material.dart';
import '../model/vehicle.dart';

class VehicleDetailsDialog extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailsDialog({Key? key, required this.vehicle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(vehicle.name),
            subtitle: Text(vehicle.model),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Class: ${vehicle.vehicleClass}"),
                Text("Cost: ${vehicle.costInCredits} Galactic Credits"),
                Text("Length: ${vehicle.length} meters"),
                Text("Cargo capacity: ${vehicle.cargoCapacity} kg"),
                Text("Consumables: ${vehicle.consumables}"),
                Text("Crew: ${vehicle.crew}"),
                Text("Passengers: ${vehicle.passengers}"),
                Text("Max atmosphering speed: ${vehicle.maxAtmospheringSpeed}"),
                SizedBox(height: 16),
                Text("Manufacturers:"),
                Wrap(
                  spacing: 8,
                  children: vehicle.manufacturers.map((manufacturer) {
                    return Chip(label: Text(manufacturer));
                  }).toList(),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
