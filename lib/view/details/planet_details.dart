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
                AppLocalizations.of(context)
                        ?.planet_diameter_text(planet.diameter ?? 0) ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.gravity ??
                    AppLocalizations.of(context)!.not_available,
                planet.gravity.replaceAll(',', '\n')),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.orbital_period ??
                    AppLocalizations.of(context)!.not_available,
                planet.orbitalPeriod.toString()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.rotation_period ??
                    AppLocalizations.of(context)!.not_available,
                AppLocalizations.of(context)?.planet_rotation_period_text(
                        planet.rotationPeriod ?? 0) ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.surface_water ??
                    AppLocalizations.of(context)!.not_available,
                "${planet.surfaceWater}%"),
            chipListWidget(
                context: context,
                items: planet.climates,
                title: AppLocalizations.of(context)?.climates ??
                    AppLocalizations.of(context)!.not_available),
            chipListWidget(
                context: context,
                items: planet.terrains,
                title: AppLocalizations.of(context)?.terrains ??
                    AppLocalizations.of(context)!.not_available),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
