import 'package:flutter/material.dart';

Widget chipListWidget({required BuildContext context, required List<String> items, required String title}) {
  if(items.isEmpty){
    return Container();
  }
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: Theme.of(context).textTheme.bodySmall),
      Wrap(
        spacing: 8,
        children: items.map((item) {
          return Chip(label: Text(item));
        }).toList(),
      ),
    ],
  );
}
