import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/widget/list_row_widget.dart';
import '../../graphql/starship_query.dart';
import '../../model/starship.dart';
import '../details/starship_details.dart';

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
            return ListRowWidget(
                listTile: ListTile(
              title: Text(starship.name),
              leading: SizedBox(
                width: 80, // Set the width to 80 pixels
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_pin_outlined),
                          const SizedBox(width: 4),
                          Text(starship.crew != "unknown"
                              ? starship.crew
                              : "n/a"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 4),
                          Text(starship.passengers != "unknown"
                              ? starship.passengers
                              : "n/a"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              trailing: Text('${starship.mglt} MGLT'),
              subtitle: Text(
                starship.model,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => StarshipDetailsDialog(starship: starship));
              },
            ));
          },
        );
      },
    );
  }
}
