import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/vehicle_query.dart';
import 'package:star_wars/util/text_utils.dart';
import 'package:star_wars/widget/list_row_widget.dart';
import '../../model/vehicle.dart';
import '../details/vehicle_details.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(getAllVehicles),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? vehicles = result.data?['allVehicles']?['vehicles'];

        if (vehicles == null) {
          return const Text('No vehicles found');
        }

        return ListView.builder(
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            final Vehicle vehicle = Vehicle.fromMap(vehicles[index]);
            return ListRowWidget(
                listTile: ListTile(
              title: Text(vehicle.name),
              leading: SizedBox(
                width: 80, // Set the width to 80 pixels
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_pin_outlined),
                          const SizedBox(width: 4),
                          Text(vehicle.crew),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 4),
                          Text(vehicle.passengers != "unknown"
                              ? vehicle.passengers
                              : "n/a"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              trailing: Text(
                vehicle.vehicleClass.upperCaseFirstLetter(),
                style: const TextStyle(fontSize: 10),
              ),
              subtitle: Text(vehicle.model),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => VehicleDetailsDialog(vehicle: vehicle));
              },
            ));
          },
        );
      },
    );
  }
}
