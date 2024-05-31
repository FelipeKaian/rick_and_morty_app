import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/controller/caracters_controller.dart';
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/view/loading.dart';
import 'characters_item.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({
    super.key,
  });

  @override
  CharactersViewState createState() => CharactersViewState();
}

class CharactersViewState extends State<CharactersView> {

  @override
  void initState() {
    super.initState();
    Provider.of<CharactersController>(context, listen: false).loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersController>(builder: (context, value, child) {
      if (value.loading) {
        return const Loading();
      }else {
        return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://i.imgur.com/NQnPLKg.jpg"),
                fit: BoxFit.cover),
            color: Color.fromARGB(255, 7, 221, 0)),
        child: ListView.builder(
            itemCount: value.characters.length,
            itemBuilder: (context, index) {
              if (index == value.characters.length - 1) {
                value.loadMore();
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          color: Theme.of(context).primaryColor),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Loading(),
                      )),
                );
              }
              final Character character = value.characters[index];
              return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CharacterItem(character));
            }),
      );
      }
      
    });
  }
}
