import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/view/details/film_details.dart';
import 'package:star_wars/widget/list_row_widget.dart';
import '../../graphql/film_query.dart';
import '../../model/film.dart';

class FilmList extends StatelessWidget {
  const FilmList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllFilms),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? films = result.data?['allFilms']?['films'];

        if (films == null) {
          return const Text('No films');
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Star_Wars_Yellow_Logo.svg/640px-Star_Wars_Yellow_Logo.svg.png',
                // Add your desired properties for the image
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: films.length,
                itemBuilder: (context, index) {
                  final Film film = Film.fromMap(films[index]);

                  return ListRowWidget(
                      listTile: ListTile(
                    dense: true,
                    title: Text(film.title),
                    leading: SizedBox(
                      width: 20,
                      child: Center(
                        child: Text("${film.episodeID}"),
                      ),
                    ),
                    trailing: Text(
                      film.director,
                      style: const TextStyle(fontSize: 10),
                    ),
                    subtitle: Text(
                      "${film.openingCrawl.removeAllNewLines().substring(0, 80)}...",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => FilmDetailsDialog(film: film),
                      );
                    },
                  ));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
