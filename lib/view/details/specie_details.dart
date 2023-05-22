import 'package:flutter/material.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../../model/specie.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_subheader_widget.dart';

class SpecieDetailsDialog extends StatelessWidget {
  final Specie specie;

  const SpecieDetailsDialog({Key? key, required this.specie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hairColors = "n/a";
    if ((specie.hairColors?.length ?? 0) > 0) {
      hairColors = specie.hairColors?.join(", ") ?? "n/a";
    }
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsHeaderWidget(context, specie.name),
            detailsSubheaderWidget(context, specie.classification),
            detailsRowWidget(
                context, "Average Height", specie.averageHeight.toString()),
            detailsRowWidget(
                context, "Average Lifespan", "${specie.averageLifespan} years"),
            detailsRowWidget(context, "Designation", specie.designation),
            detailsRowWidget(context, "Language", specie.language),
            detailsRowWidget(
                context, "Eye Colors", specie.eyeColors?.join(", ") ?? "N/A"),
            detailsRowWidget(context, "Hair Colors", hairColors),
            detailsRowWidget(
                context, "Skin Colors", specie.skinColors?.join(", ") ?? "N/A"),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
