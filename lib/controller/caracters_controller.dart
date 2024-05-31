import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rick_and_morty_app/model/filter.dart';
import '../model/character.dart';

class CharactersController extends ChangeNotifier {
  List<Character> characters = [];

  bool loading = true;
  int pageNumber = 0;

  Filter filter =
      Filter(name: "", status: "", species: "", type: "", gender: "");

  void setFilter(filter) {
    this.filter = filter;
    characters.clear();
    pageNumber = 0;
    loadMore();
  }

  Future<void> loadMore() async {
    pageNumber++;
    getCharacters();
  }

  Future<void> getCharacters() async {
    String filterQuery = '';

    if (filter.name != "") {
      filterQuery += '&name=${filter.name}';
    }

    if (filter.status != "" && filter.status != "all") {
      filterQuery += '&status=${filter.status}';
    }

    if (filter.species != "") {
      filterQuery += '&species=${filter.species}';
    }

    if (filter.type != "") {
      filterQuery += '&type=${filter.type}';
    }

    if (filter.gender != "" && filter.gender != "all") {
      filterQuery += '&gender=${filter.gender}';
    }

    print(
        'https://rickandmortyapi.com/api/character/?page=$pageNumber$filterQuery');

    final response = await get(Uri.parse(
        'https://rickandmortyapi.com/api/character/?page=$pageNumber$filterQuery'));

    Map<String, dynamic> responseList = json.decode(response.body);

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

    loading = false;
    notifyListeners();
  }
}
