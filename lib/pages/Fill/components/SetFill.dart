import 'package:finances/bloc/BillBloc.dart';
import 'package:finances/pages/AddBill/components/Input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Fill.dart';
import 'FillDialog.dart';
import 'Label.dart';

class SetFill extends StatelessWidget {
  var formatter = NumberFormat("#,##0.00", 'en-US');

  @override
  Widget build(BuildContext context) {
    BillBloc bloc = Provider.of<BillBloc>(context);
    double fill = bloc.getFill();

    void onChangeSpend(String value) {
      var spend = double.parse(value);

      if (spend != null) {
        bloc.setFill(spend);
      }
    }

    Future<void> setFill() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return FillDialog(
                fill: formatter.format(fill), onChange: onChangeSpend);
          })) {
        case null:
          break;
      }
    }

    return FlatButton(
      child: Column(
        children: [
          Label(label: "renda"),
          Text(
            "R\$ ${formatter.format(fill)}",
            style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).colorScheme.primaryVariant,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      onPressed: setFill,
    );
  }
}
