import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  String label;

  Label({@required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.label,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }
}
