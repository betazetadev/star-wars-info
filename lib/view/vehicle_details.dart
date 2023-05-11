import 'package:flutter/material.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../model/vehicle.dart';
import '../widget/details_header_widget.dart';

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
            detailsRowWidget(context, "Class", vehicle.vehicleClass),
            detailsRowWidget(context, "Cost", vehicle.costInCredits.toString()),
            detailsRowWidget(context, "Length", "${vehicle.length} meters"),
            detailsRowWidget(context, "Cargo capacity", "${vehicle.cargoCapacity} kg"),
            detailsRowWidget(context, "Consumables", vehicle.consumables),
            detailsRowWidget(context, "Crew", vehicle.crew),
            detailsRowWidget(context, "Passengers", vehicle.passengers),
            detailsRowWidget(context, "Max atmosphering speed", vehicle.maxAtmospheringSpeed.toString()),
            const Text("Manufacturers:"),
            Wrap(
              spacing: 8,
              children: vehicle.manufacturers.map((manufacturer) {
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
