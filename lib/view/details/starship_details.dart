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
                AppLocalizations.of(context)?.starship_class ??
                    AppLocalizations.of(context)!.not_available,
                starship.starshipClass),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.cost ??
                    AppLocalizations.of(context)!.not_available,
                AppLocalizations.of(context)
                        ?.starship_cost_text(starship.costInCredits) ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.length ??
                    AppLocalizations.of(context)!.not_available,
                "${starship.length}m"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.cargo_capacity ??
                    AppLocalizations.of(context)!.not_available,
                "${starship.cargoCapacity}kg"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.consumables ??
                    AppLocalizations.of(context)!.not_available,
                starship.consumables),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.crew ??
                    AppLocalizations.of(context)!.not_available,
                starship.crew),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.passengers ??
                    AppLocalizations.of(context)!.not_available,
                starship.passengers),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.max_atmosphering_speed ??
                    AppLocalizations.of(context)!.not_available,
                starship.maxAtmospheringSpeed?.toString() ??
                    AppLocalizations.of(context)!.not_available),
            detailsRowWidget(context, "MGLT", starship.mglt.toString()),
            chipListWidget(
                context: context,
                items: starship.manufacturers,
                title: AppLocalizations.of(context)?.manufacturers ??
                    AppLocalizations.of(context)!.not_available),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
