import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../../model/vehicle.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_subheader_widget.dart';

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
            detailsSubheaderWidget(context, vehicle.vehicleClass.upperCaseFirstLetter()),
            detailsRowWidget(context, "Cost", vehicle.costInCredits.toString()),
            detailsRowWidget(context, "Length", "${vehicle.length} meters"),
            detailsRowWidget(
                context, "Cargo capacity", "${vehicle.cargoCapacity} kg"),
            detailsRowWidget(context, "Consumables", vehicle.consumables),
            detailsRowWidget(context, "Crew", vehicle.crew),
            detailsRowWidget(context, "Passengers", vehicle.passengers),
            detailsRowWidget(context, "Max atmosphering speed",
                vehicle.maxAtmospheringSpeed.toString()),
            chipListWidget(
                context: context,
                items: vehicle.manufacturers,
                title: "Manufacturers"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
