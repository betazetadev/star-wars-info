import 'package:flutter/material.dart';
import '../model/starship.dart';

class StarshipDetailsDialog extends StatelessWidget {
  final Starship starship;

  const StarshipDetailsDialog({Key? key, required this.starship})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(starship.name),
            subtitle: Text(starship.model),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Class: ${starship.starshipClass}"),
                Text("Cost: ${starship.costInCredits} Galactic Credits"),
                Text("Length: ${starship.length} meters"),
                Text("Cargo capacity: ${starship.cargoCapacity} kg"),
                Text("Consumables: ${starship.consumables}"),
                Text("Crew: ${starship.crew}"),
                Text("Passengers: ${starship.passengers}"),
                Text(
                    "Max atmosphering speed: ${starship.maxAtmospheringSpeed ?? "N/A"}"),
                Text("MGLT: ${starship.mglt}"),
                SizedBox(height: 16),
                Text("Manufacturers:"),
                Wrap(
                  spacing: 8,
                  children: starship.manufacturers.map((manufacturer) {
                    return Chip(label: Text(manufacturer));
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
