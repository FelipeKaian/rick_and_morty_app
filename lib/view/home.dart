import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/controller/caracters_controller.dart';
import 'package:rick_and_morty_app/view/characters_view.dart';
import 'package:rick_and_morty_app/view/loading.dart';

import 'search_filters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchFilters()));
          },
          child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
                border: Border.fromBorderSide(
                  BorderSide(color: Theme.of(context).primaryColor, width: 10),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/ce/8e/f0/ce8ef054f2c05d07b7eb140573ab86a3.jpg"),
                  fit: BoxFit.none,
                  scale: 9,
                ),
              )),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140.0),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                "https://logosmarcas.net/wp-content/uploads/2022/01/Rick-And-Morty-Logo.png",
                height: 110.0,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
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
        body: TabBarView(
          children: [
            CharactersView(),
            const Center(child: Loading()),
            const Center(child: Loading()),
          ],
        ),
      ),
    );
  }
}
