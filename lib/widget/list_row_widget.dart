import 'package:flutter/material.dart';

class ListRowWidget extends StatelessWidget {
  final Widget listTile;

  const ListRowWidget({Key? key, required this.listTile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: listTile,
    );
  }
}
