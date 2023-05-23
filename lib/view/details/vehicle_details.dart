import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../../model/vehicle.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_subheader_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehicleDetailsDialog extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailsDialog({Key? key, required this.vehicle})
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
            detailsHeaderWidget(context, vehicle.name),
            detailsSubheaderWidget(
                context, vehicle.vehicleClass.upperCaseFirstLetter()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.cost ??
                    AppLocalizations.of(context)!.not_available,
                vehicle.costInCredits.toString()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.length ??
                    AppLocalizations.of(context)!.not_available,
                "${vehicle.length}m"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.cargo_capacity ??
                    AppLocalizations.of(context)!.not_available,
                "${vehicle.cargoCapacity}kg"),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.consumables ??
                    AppLocalizations.of(context)!.not_available,
                vehicle.consumables),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.crew ??
                    AppLocalizations.of(context)!.not_available,
                vehicle.crew),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.passengers ??
                    AppLocalizations.of(context)!.not_available,
                vehicle.passengers),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)?.max_atmosphering_speed ??
                    AppLocalizations.of(context)!.not_available,
                vehicle.maxAtmospheringSpeed.toString()),
            chipListWidget(
                context: context,
                items: vehicle.manufacturers,
                title: AppLocalizations.of(context)?.manufacturers ??
                    AppLocalizations.of(context)!.not_available),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
