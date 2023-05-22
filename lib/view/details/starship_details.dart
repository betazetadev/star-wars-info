import 'package:flutter/material.dart';
import '../../model/starship.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_row_widget.dart';
import '../../widget/details_subheader_widget.dart';

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
            detailsRowWidget(context, "Class", starship.starshipClass),
            detailsRowWidget(context, "Cost", "${starship.costInCredits} Galactic Credits"),
            detailsRowWidget(context, "Length", "${starship.length} meters"),
            detailsRowWidget(context, "Cargo capacity", "${starship.cargoCapacity} kg"),
            detailsRowWidget(context, "Consumables", starship.consumables),
            detailsRowWidget(context, "Crew", starship.crew),
            detailsRowWidget(context, "Passengers", starship.passengers),
            detailsRowWidget(context, "Max atmosphering speed", starship.maxAtmospheringSpeed.toString()),
            detailsRowWidget(context, "MGLT", starship.mglt.toString()),
            const Text("Manufacturers"),
            Wrap(
              spacing: 8,
              children: starship.manufacturers.map((manufacturer) {
                return Chip(label: Text(manufacturer));
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
