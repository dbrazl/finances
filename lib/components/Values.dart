import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Values extends StatelessWidget {
  var formater = NumberFormat("#,##0.00", "en_US");

  double spend;
  double rest;

  Values({@required this.spend, @required this.rest});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "gastos",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          "R\$ ${formater.format(spend)}",
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Ubuntu',
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "restam",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          "R\$ ${formater.format(rest)}",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Ubuntu',
            color: Theme.of(context).colorScheme.secondaryVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
