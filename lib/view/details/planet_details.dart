import 'package:flutter/material.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import 'package:star_wars/widget/details_subheader_widget.dart';
import '../../model/planet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            detailsSubheaderWidget(
                context,
                AppLocalizations.of(context)!
                    .planet_diameter_text(planet.diameter ?? 0)),
            detailsRowWidget(context, AppLocalizations.of(context)!.gravity,
                planet.gravity.replaceAll(',', '\n')),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.orbital_period,
                planet.orbitalPeriod.toString()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.rotation_period,
                AppLocalizations.of(context)!
                    .planet_rotation_period_text(planet.rotationPeriod ?? 0)),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.surface_water,
                "${planet.surfaceWater}%"),
            chipListWidget(
                context: context,
                items: planet.climates,
                title: AppLocalizations.of(context)!.climates),
            chipListWidget(
                context: context,
                items: planet.terrains,
                title: AppLocalizations.of(context)!.terrains),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
