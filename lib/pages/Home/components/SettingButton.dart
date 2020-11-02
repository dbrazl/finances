import 'package:finances/pages/Fill/Fill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goToFill() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Fill()),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FlatButton(
          padding: EdgeInsets.zero,
          minWidth: 24,
          child: Icon(Feather.settings, size: 24, color: Colors.black),
          onPressed: goToFill,
        ),
      ],
    );
  }
}
