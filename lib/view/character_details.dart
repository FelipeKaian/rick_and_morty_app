import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/view/loading.dart';

import '../model/character.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails(this.character, {super.key});

  @override
  Widget build(BuildContext context) {

    var descriptionText = "${character.name} is a ${character.gender.toLowerCase()} ${character.species.toLowerCase()} and stay ${character.status.toLowerCase()}";

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://wallpapers-clan.com/wp-content/uploads/2021/08/rick-and-morty-schrodingers-cats-wallpaper-scaled.jpg"),
              fit: BoxFit.cover),
          color: Color.fromARGB(255, 51, 51, 51),
        ),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(200, 0, 138, 5),
                  Color.fromARGB(200, 145, 255, 102),
                  Color.fromARGB(200, 0, 255, 0),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            width: 350,
            height: 550,
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  character.name,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 30, 100, 0),
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(character.image),
                        fit: BoxFit.cover),
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  descriptionText,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 30, 100, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
