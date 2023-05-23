import 'package:flutter/material.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import '../../model/starship.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_row_widget.dart';
import '../../widget/details_subheader_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StarshipDetailsDialog extends StatelessWidget {
  final Starship starship;

  const StarshipDetailsDialog({Key? key, required this.starship})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsHeaderWidget(context, starship.name),
            detailsSubheaderWidget(context, starship.model),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.starship_class,
                starship.starshipClass),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.cost,
                AppLocalizations.of(context)
                        ?.starship_cost_text(starship.costInCredits) ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.length,
                "${starship.length}m"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.cargo_capacity,
                "${starship.cargoCapacity}kg"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.consumables,
                starship.consumables),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.crew,
                starship.crew),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.passengers,
                starship.passengers),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.max_atmosphering_speed,
                starship.maxAtmospheringSpeed?.toString() ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(context, "MGLT", starship.mglt.toString()),
            chipListWidget(
                context: context,
                items: starship.manufacturers,
                title: AppLocalizations.of(context)!.manufacturers),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
