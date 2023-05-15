import 'package:flutter/material.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/details_header_widget.dart';
import 'package:star_wars/widget/details_row_widget.dart';
import 'package:star_wars/widget/details_subheader_widget.dart';
import '../model/film.dart';

class FilmDetailsDialog extends StatelessWidget {
  final Film film;

  const FilmDetailsDialog({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            detailsHeaderWidget(context, film.title),
            detailsSubheaderWidget(context,
                'Episode ${film.episodeID} (${film.releaseDate.substring(0, 4)})'),
            Text(film.openingCrawl.removeAllNewLines(),
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyMedium),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Column(
                children: [
                  detailsRowWidget(context, "Directed by", film.director,
                      textStyle: Theme.of(context).textTheme.bodySmall),
                  detailsRowWidget(context, "Release date", film.releaseDate,
                      textStyle: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
