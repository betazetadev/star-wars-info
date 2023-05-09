import 'package:flutter/material.dart';
import '../model/planet.dart';

class PlanetDetailsDialog extends StatelessWidget {
  final Planet planet;

  const PlanetDetailsDialog({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(planet.name),
            subtitle: Text("Created: ${planet.created}"),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Diameter: ${planet.diameter} km"),
                Text("Gravity: ${planet.gravity}"),
                Text("Orbital period: ${planet.orbitalPeriod} days"),
                Text("Rotation period: ${planet.rotationPeriod} hours"),
                Text("Surface water: ${planet.surfaceWater}%"),
                const SizedBox(height: 16),
                const Text("Climates:"),
                Wrap(
                  spacing: 8,
                  children: planet.climates.map((climate) {
                    return Chip(label: Text(climate));
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text("Terrains:"),
                Wrap(
                  spacing: 8,
                  children: planet.terrains.map((terrain) {
                    return Chip(label: Text(terrain));
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
