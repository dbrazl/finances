import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Dropdown extends StatelessWidget {
  List<String> options = ['Despeza variável', 'Despeza fixa'];
  Function onChange;
  String value;

  Dropdown({@required this.onChange, @required this.value});

  List<DropdownMenuItem<String>> getItems() {
    return options.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DropdownButton<String>(
          value: value,
          icon: Icon(Feather.chevron_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          onChanged: onChange,
          items: this.getItems(),
        ),
      ),
    );
  }
}
