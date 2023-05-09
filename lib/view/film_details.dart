import 'package:flutter/material.dart';
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  film.title,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      'Episode ${film.episodeID}',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context).accentColor,
                          ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '(${film.releaseDate.substring(0, 4)})',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  film.openingCrawl.replaceAll(RegExp('[\n]'), ''),
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.0,
                      ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Directed by: ${film.director}',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'Created: ${film.created}',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
