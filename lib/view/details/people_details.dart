import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_subheader_widget.dart';
import '../../model/person.dart';
import '../../widget/details_row_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PeopleDetailsDialog extends StatelessWidget {
  final Person person;

  const PeopleDetailsDialog({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            detailsHeaderWidget(context, person.name),
            detailsSubheaderWidget(
                context, person.gender.upperCaseFirstLetter()),
            detailsRowWidget(context, AppLocalizations.of(context)!.height,
                person.height.toString()),
            detailsRowWidget(context, AppLocalizations.of(context)!.birth_year,
                person.birthYear),
            detailsRowWidget(context, AppLocalizations.of(context)!.eye_color,
                person.eyeColor),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
