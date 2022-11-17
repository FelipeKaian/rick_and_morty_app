import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/widgets/loading.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Loading()));
      },
      child: Container(
        height: 220,
        width: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color.fromARGB(255, 51, 51, 51)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              SizedBox(
                width: 170.0,
                height: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImage(character.image),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(252, 0, 138, 5),
                          Color.fromARGB(255, 145, 255, 102),
                          Color.fromARGB(255, 0, 255, 0),
                        ],
                      )),
                  height: 155.0,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        character.name,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 36, 121, 0),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${character.species} | ${character.gender}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 36, 121, 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
