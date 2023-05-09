import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:star_wars/graphql/vehicle_query.dart';
import '../model/vehicle.dart';
import '../view/vehicle_details.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({super.key, required this.title});

  final String title;

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
            return ListTile(
              title: Text(vehicle.name),
              subtitle: Text(
                "Model: ${vehicle.model}\nClass: ${vehicle.vehicleClass}\nCrew: ${vehicle.crew}\nPassengers: ${vehicle.passengers}",
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => VehicleDetailsDialog(vehicle: vehicle));
              },
            );
          },
        );
      },
    );
  }
}
