import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/view/film_details.dart';
import '../graphql/film_query.dart';
import '../model/film.dart';

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

        return ListView.builder(
          itemCount: films.length,
          itemBuilder: (context, index) {
            final Film film = Film.fromMap(films[index]);

            return ListTile(
              title: Text(film.title),
              subtitle: Text('${film.releaseDate} - Episode ${film.episodeID}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => FilmDetailsDialog(film: film));
              },
            );
          },
        );
      },
    );
  }
}
