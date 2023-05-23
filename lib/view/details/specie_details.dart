import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/chip_list_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import '../../model/specie.dart';
import '../../widget/details_header_widget.dart';
import '../../widget/details_subheader_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpecieDetailsDialog extends StatelessWidget {
  final Specie specie;

  const SpecieDetailsDialog({Key? key, required this.specie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsHeaderWidget(context, specie.name),
            detailsSubheaderWidget(
                context, specie.classification.upperCaseFirstLetter()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.average_height,
                specie.averageHeight.toString()),
            detailsRowWidget(
                context,
                AppLocalizations.of(context)!.average_lifespan,
                AppLocalizations.of(context)!
                    .average_lifespan_text(specie.averageLifespan)),
            detailsRowWidget(context, AppLocalizations.of(context)!.designation,
                specie.designation),
            detailsRowWidget(context, AppLocalizations.of(context)!.language,
                specie.language),
            chipListWidget(
                context: context,
                items: specie.eyeColors ?? [],
                title: AppLocalizations.of(context)!.eye_colors),
            chipListWidget(
                context: context,
                items: specie.hairColors ?? [],
                title: AppLocalizations.of(context)!.hair_colors),
            chipListWidget(
                context: context,
                items: specie.skinColors ?? [],
                title: AppLocalizations.of(context)!.skin_colors),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
