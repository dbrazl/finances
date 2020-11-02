import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String placeholder;
  TextInputType type;
  Function onChange;
  double value;

  Input(
      {@required this.placeholder,
      @required this.type,
      @required this.onChange,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onChanged: this.onChange,
        keyboardType: this.type,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
        decoration: InputDecoration(
          hintText: this.placeholder,
          hintStyle: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
      ),
      height: 50,
    );
  }
}
