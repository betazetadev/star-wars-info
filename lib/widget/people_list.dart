import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/person_query.dart';
import '../model/person.dart';
import '../view/people_details.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllPeople),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? people = result.data?['allPeople']?['people'];

        if (people == null) {
          return const Text('No films');
        }

        return ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final Person person = Person.fromMap(people[index]);

            return ListTile(
              title: Text(person.name),
              subtitle:
                  Text('Gender: ${person.gender}, Height: ${person.height}'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => PeopleDetailsDialog(person: person));
              },
            );
          },
        );
      },
    );
  }
}
