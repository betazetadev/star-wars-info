import 'package:flutter/material.dart';
import 'package:star_wars/view/list/starship_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'list/film_list.dart';
import 'list/people_list.dart';
import 'list/planet_list.dart';
import 'list/specie_list.dart';
import 'list/vehicle_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final List<Map<String, dynamic>> _tabs = [];

  int _currentIndex = 0;
  String _title = '';

  @override
  void initState() {
    super.initState();
  }

  _initTabs() {
    _tabs.add({
      'widget': const FilmList(),
      'title': AppLocalizations.of(context)!.films,
    });
    _tabs.add({
      'widget': const PeopleList(),
      'title': AppLocalizations.of(context)!.people,
    });
    _tabs.add({
      'widget': const PlanetList(),
      'title': AppLocalizations.of(context)!.planets,
    });
    _tabs.add({
      'widget': const VehicleList(),
      'title': AppLocalizations.of(context)!.vehicles,
    });
    _tabs.add({
      'widget': const StarshipList(),
      'title': AppLocalizations.of(context)!.starships,
    });
    _tabs.add({
      'widget': const SpecieList(),
      'title': AppLocalizations.of(context)!.species,
    });
  }

  @override
  Widget build(BuildContext context) {
    _initTabs();
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_currentIndex]['title']),
      ),
      body: _tabs[_currentIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            if (index > _tabs.length - 1) {
              return;
            }
            _title = _tabs[index]['title'];
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.movie),
            label: AppLocalizations.of(context)!.films,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: AppLocalizations.of(context)!.people,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.public),
            label: AppLocalizations.of(context)!.planets,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.directions_car),
            label: AppLocalizations.of(context)!.vehicles,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.flight),
            label: AppLocalizations.of(context)!.starships,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.pets),
            label: AppLocalizations.of(context)!.species,
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _initTabs();
    super.didChangeDependencies();
  }
}
