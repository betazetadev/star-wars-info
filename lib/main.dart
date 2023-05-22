import 'package:flutter/material.dart';
import 'package:star_wars/theme_data.dart';
import 'package:star_wars/view/main_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'https://swapi-graphql.netlify.app/.netlify/functions/index', // [Explorer](https://studio.apollographql.com/public/star-wars-swapi/variant/current/explorer)
    );
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
      ),
    );
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          title: 'Star Wars',
          theme: yellowGrayBlackTheme,
          home: const MainScreen(),
        ));
  }
}
