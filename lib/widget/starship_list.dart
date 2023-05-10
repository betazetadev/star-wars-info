import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphql/starship_query.dart';
import '../model/starship.dart';
import '../view/starship_details.dart';

class StarshipList extends StatelessWidget {
  const StarshipList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllStarships),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? starships = result.data?['allStarships']?['starships'];

        if (starships == null) {
          return const Text('No planets found');
        }

        return ListView.builder(
          itemCount: starships.length,
          itemBuilder: (context, index) {
            final Starship starship = Starship.fromMap(starships[index]);
            return ListTile(
              title: Text(starship.name),
              leading: Text('${starship.mglt} MGLT'),
              subtitle: Text(
                "Model: ${starship.model}\nClass: ${starship.starshipClass}\nCrew: ${starship.crew}\nPassengers: ${starship.passengers}",
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => StarshipDetailsDialog(starship: starship));
              },
            );
          },
        );
      },
    );
  }
}
