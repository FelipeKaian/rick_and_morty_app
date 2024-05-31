import 'package:flutter/material.dart';

class StyledDropDown extends StatelessWidget {
  const StyledDropDown({super.key, required this.itens, required this.setValue, required this.selectedValue});

  final String selectedValue;
  final List<String> itens;
  final void Function(String?) setValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: DropdownButton(
        isExpanded: true,
        value: selectedValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: itens.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item,style: const TextStyle(color: Colors.green,fontSize: 20),),
          );
        }).toList(),
        onChanged: setValue,
      ),
    );
  }
}

