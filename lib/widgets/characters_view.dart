import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/services/api.dart';
import 'package:rick_and_morty_app/widgets/loading.dart';
import 'characters_item.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  CharactersViewState createState() => CharactersViewState();
}

class CharactersViewState extends State<CharactersView> {
  late bool loading;
  late List<Character> characters;
  late int pageNumber;

  @override
  void initState() {
    super.initState();
    loading = true;
    pageNumber = 1;
    characters = <Character>[];
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      var newCharacters = await getCharacters(pageNumber);
      characters.addAll(newCharacters);

      setState(() {
        loading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print("error --> $e");
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCharactersView();
  }

  Widget buildCharactersView() {
    if (characters.isEmpty) {
      return const Center(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: AnimatedRotation(
                turns: 40000,
                duration: Duration(seconds: 1),
                child: Loading())),
      );
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://i.imgur.com/NQnPLKg.jpg"),
              fit: BoxFit.cover),
          color: Color.fromARGB(255, 7, 221, 0)),
      child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            if (index == characters.length - 1) {
              pageNumber += 1;
              loading = true;
              fetchCharacters();
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    height: 220,
                    width: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color.fromARGB(255, 51, 51, 51)),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Loading(),
                    )),
              );
            }
            final Character character = characters[index];
            return Padding(
                padding: const EdgeInsets.all(15.0),
                child: CharacterItem(character));
          }),
    );
  }
}
