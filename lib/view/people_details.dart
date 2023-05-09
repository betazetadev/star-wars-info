import 'package:flutter/material.dart';
import '../model/person.dart';

class PeopleDetailsDialog extends StatelessWidget {
  final Person person;

  const PeopleDetailsDialog({Key? key, required this.person}) : super(key: key);

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
                  person.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Gender: ${person.gender}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Height: ${person.height}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Birth Year: ${person.birthYear}',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Eye Color: ${person.eyeColor}',
                  style: Theme.of(context).textTheme.subtitle2,
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
