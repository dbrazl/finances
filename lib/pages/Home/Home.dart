import 'package:finances/pages/AddBill/AddBill.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'components/FixedBills.dart';
import 'components/VariableBills.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goToAddBill() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddBill(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: TabBarView(
          children: <Widget>[
            FixedBills(),
            VariableBills(),
          ],
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Feather.plus,
          color: Colors.white,
          size: 24,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
        onPressed: goToAddBill,
      ),
    );
  }
}
