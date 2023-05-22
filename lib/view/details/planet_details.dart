import 'package:flutter/material.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../../model/planet.dart';

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
            detailsRowWidget(
                context, "Gravity", planet.gravity.replaceAll(',', '\n')),
            detailsRowWidget(
                context, "Orbital period", planet.orbitalPeriod.toString()),
            detailsRowWidget(
                context, "Rotation period", "${planet.rotationPeriod} hours"),
            detailsRowWidget(
                context, "Surface water", "${planet.surfaceWater}%"),
            chipListWidget(
                context: context, items: planet.climates, title: "Climates"),
            chipListWidget(
                context: context, items: planet.terrains, title: "Terrains"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
