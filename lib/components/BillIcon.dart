import 'package:flutter/material.dart';

class BillIcon extends StatelessWidget {
  String icon;

  BillIcon({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          this.icon,
          height: 24,
          width: 24,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: 50,
      height: 50,
    );
  }
}
