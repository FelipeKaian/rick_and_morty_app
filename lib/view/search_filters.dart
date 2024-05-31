import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/controller/caracters_controller.dart';
import 'package:rick_and_morty_app/model/filter.dart';
import 'package:rick_and_morty_app/view/styled_drop_down.dart';
import 'package:rick_and_morty_app/view/styled_text_input.dart';

import 'home.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({
    super.key,
  });

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  var nameController = TextEditingController();
  var status = "all";
  var speciesController = TextEditingController();
  var typeController = TextEditingController();
  var gender = "all";

  final List<String> statusOptions = ["all", "alive", "dead", "unknown"];

  final List<String> genderOptions = [
    "all",
    "female",
    "male",
    "genderless",
    "unknown"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://wallpapers-clan.com/wp-content/uploads/2021/08/rick-and-morty-schrodingers-cats-wallpaper-scaled.jpg"),
                fit: BoxFit.cover),
            color: Color.fromARGB(255, 51, 51, 51),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 70.0),
                    child: Text(
                      "Choose the filters you want to apply",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                  StyledTextInput(
                      labelText: "Name",
                      hintText: "Rick, Morty, Summer...",
                      controller: nameController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Status:",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        StyledDropDown(
                          selectedValue: status,
                          itens: statusOptions,
                          setValue: (String? value) {
                            setState(() {
                              status = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  StyledTextInput(
                    labelText: "Species",
                    hintText: "Human, Alian...",
                    controller: speciesController,
                  ),
                  StyledTextInput(
                      labelText: "Type",
                      hintText: "Rick, Morty, Summer...",
                      controller: typeController),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gender:",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        StyledDropDown(
                          selectedValue: gender,
                          itens: genderOptions,
                          setValue: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                    child: TextButton(
                      onPressed: () {
                        Filter filter = Filter(
                            name: nameController.text,
                            status: status,
                            species: speciesController.text,
                            type: typeController.text,
                            gender: gender);
                        Provider.of<CharactersController>(context,
                                listen: false)
                            .setFilter(filter);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }), (route) => false);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        height: 60,
                        child: const Center(
                          child: Text(
                            "Save filter",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
