import 'package:flutter/material.dart';
import 'package:star_wars/widget/starship_list.dart';
import '../widget/film_list.dart';
import '../widget/people_list.dart';
import '../widget/planet_list.dart';
import '../widget/specie_list.dart';
import '../widget/vehicle_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final List<Widget> _tabs = const [
    FilmList(
      title: 'Star Wars films',
    ),
    PeopleList(title: 'Star Wars people'),
    PlanetList(
      title: 'Star Wars planets',
    ),
    VehicleList(
      title: 'Star Wars vehicles',
    ),
    StarshipList(title: 'Star Wars starships'),
    SpecieList(title: 'Star Wars species'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars films'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueGrey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index > _tabs.length - 1) {
              return;
            }
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Planets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Starships',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Species',
          ),
        ],
      ),
    );
  }
}
