import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/planet_query.dart';
import '../model/planet.dart';
import '../view/planet_details.dart';

class PlanetList extends StatelessWidget {
  const PlanetList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllPlanets),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? planets = result.data?['allPlanets']?['planets'];

        if (planets == null) {
          return const Text('No planets found');
        }

        return ListView.builder(
          itemCount: planets.length,
          itemBuilder: (context, index) {
            final Planet planet = Planet.fromMap(planets[index]);
            return ListTile(
              title: Text(planet.name),
              leading: SizedBox(
                width: 80, // Set the width to 80 pixels
                child: Center(
                  child: Text("${planet.diameter} km"),
                ),
              ),
              subtitle: Text(
                  "Gravity: ${planet.gravity}, Population: ${planet.population}"),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => PlanetDetailsDialog(planet: planet));
              },
            );
          },
        );
      },
    );
  }
}
