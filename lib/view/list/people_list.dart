import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/person_query.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/list_row_widget.dart';
import '../../model/person.dart';
import '../details/people_details.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({super.key});

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
            return ListRowWidget(
                listTile: ListTile(
              title: Text(person.name),
              leading: SizedBox(
                width: 50,
                child: Center(
                  child: Text(person.gender.upperCaseFirstLetter()),
                ),
              ),
              subtitle: Text('Birth year: ${person.birthYear}'),
              trailing: Text(
                "${person.height.toString()} cm",
                style: const TextStyle(fontSize: 10),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => PeopleDetailsDialog(person: person));
              },
            ));
          },
        );
      },
    );
  }
}
