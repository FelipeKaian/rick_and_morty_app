import 'dart:convert';

import 'package:http/http.dart';

import '../model/character.dart';

getCharacters(pageNumber) async {
  final response = await get(
      Uri.parse("https://rickandmortyapi.com/api/character/?page=$pageNumber"));

  Map<String, dynamic> responseList = json.decode(response.body);

  List<Character> characters = [];

  responseList['results'].forEach((data) {
    characters.add(Character(
        data['id'],
        data['name'],
        data['status'],
        data['species'],
        data['type'],
        data['gender'],
        data['image'],
        data['url']));
  });

  return characters;
}
