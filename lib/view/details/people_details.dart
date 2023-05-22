import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_subheader_widget.dart';
import '../../model/person.dart';
import '../../widget/details_row_widget.dart';

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
            detailsRowWidget(context, 'Height', person.height.toString()),
            detailsRowWidget(context, 'Birth Year', person.birthYear),
            detailsRowWidget(context, 'Eye Color', person.eyeColor),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
