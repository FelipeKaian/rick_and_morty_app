import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/controller/caracters_controller.dart';

import 'view/home.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(ChangeNotifierProvider(
      create: (context) => CharactersController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color.fromARGB(255, 51, 51, 51),
        ),
        title: "App",
        home: const Home(),
      )));
}
