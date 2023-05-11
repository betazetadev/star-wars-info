import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/vehicle_query.dart';
import '../graphql/specie_query.dart';
import '../model/specie.dart';
import '../model/vehicle.dart';
import '../view/specie_details.dart';
import '../view/vehicle_details.dart';

class SpecieList extends StatelessWidget {
  const SpecieList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllSpecies),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? species = result.data?['allSpecies']?['species'];

        if (species == null) {
          return const Text('No vehicles found');
        }

        return ListView.builder(
          itemCount: species.length,
          itemBuilder: (context, index) {
            final Specie specie = Specie.fromMap(species[index]);
            return ListTile(
              title: Text(specie.name),
              leading: SizedBox(
                width: 80, // Set the width to 80 pixels
                child: Center(
                  child: Text(specie.classification),
                ),
              ),
              subtitle: Text(
                "Language: ${specie.language}\nDesignation: ${specie.designation}",
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => SpecieDetailsDialog(specie: specie));
              },
            );
          },
        );
      },
    );
  }
}
