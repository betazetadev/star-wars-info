import 'package:flutter/material.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../model/planet.dart';

class PlanetDetailsDialog extends StatelessWidget {
  final Planet planet;

  const PlanetDetailsDialog({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsHeaderWidget(context, planet.name),
            detailsRowWidget(context, "Diameter", "${planet.diameter} km"),
            detailsRowWidget(context, "Gravity", planet.gravity.replaceAll(',', '\n')),
            detailsRowWidget(
                context, "Orbital period", planet.orbitalPeriod.toString()),
            detailsRowWidget(
                context, "Rotation period", "${planet.rotationPeriod} hours"),
            detailsRowWidget(
                context, "Surface water", "${planet.surfaceWater}%"),
            const Text("Climates:"),
            Wrap(
              spacing: 8,
              children: planet.climates.map((climate) {
                return Chip(label: Text(climate));
              }).toList(),
            ),
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
    );
  }
}
