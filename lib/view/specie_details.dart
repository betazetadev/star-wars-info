import 'package:flutter/material.dart';
import '../model/specie.dart';
import '../model/vehicle.dart';

class SpecieDetailsDialog extends StatelessWidget {
  final Specie specie;

  const SpecieDetailsDialog({Key? key, required this.specie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(specie.name),
            subtitle: Text(specie.classification),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Average Height: ${specie.averageHeight}"),
                Text("Average Lifespan: ${specie.averageLifespan} years"),
                Text("Designation: ${specie.designation}"),
                Text("Language: ${specie.language}"),
                const SizedBox(height: 16),
                Text("Eye Colors: ${specie.eyeColors?.join(", ")}"),
                Text("Hair Colors: ${specie.hairColors?.join(", ")}"),
                Text("Skin Colors: ${specie.skinColors?.join(", ")}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
