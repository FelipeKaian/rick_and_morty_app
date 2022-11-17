import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/widgets/characters_view.dart';
import 'package:rick_and_morty_app/widgets/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromRGBO(88, 221, 0, 1),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(140.0),
            child: AppBar(
              centerTitle: true,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://logosmarcas.net/wp-content/uploads/2022/01/Rick-And-Morty-Logo.png", height: 110.0,
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 51, 51, 51),
              bottom: TabBar(
                indicatorColor: const Color.fromRGBO(88, 221, 0, 1),
                labelColor: const Color.fromRGBO(88, 221, 0, 1),
                unselectedLabelColor: Colors.grey,
                labelPadding: const EdgeInsets.all(8.0),
                tabs: [
                  Column(
                    children: const [
                      Icon(
                        Icons.accessibility,
                        size: 30.0,
                      ),
                      Text("Characters")
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 30.0,
                      ),
                      Text("Locations")
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(
                        Icons.video_collection,
                        size: 30.0,
                      ),
                      Text("Episodes")
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              CharactersView(),
              Center(child: Loading()),
              Center(child: Loading()),
            ],
          ),
        ),
      ),
    );
  }
}

class CharactersTab extends StatefulWidget {
  const CharactersTab({super.key});
  @override
  State<CharactersTab> createState() => _CharactersTabState();
}

class _CharactersTabState extends State<CharactersTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LocationsTab extends StatefulWidget {
  const LocationsTab({super.key});

  @override
  State<LocationsTab> createState() => _LocationsTabState();
}

class _LocationsTabState extends State<LocationsTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class EpisodesTab extends StatefulWidget {
  const EpisodesTab({super.key});

  @override
  State<EpisodesTab> createState() => _EpisodesTabState();
}

class _EpisodesTabState extends State<EpisodesTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
