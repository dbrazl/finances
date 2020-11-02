import 'package:finances/bloc/BillBloc.dart';
import 'package:finances/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'BillIcon.dart';

class BillItem extends StatelessWidget {
  String name;
  String icon;
  double value;

  BillItem({@required this.name, @required this.icon, @required this.value});

  @override
  Widget build(BuildContext context) {
    var formater = NumberFormat("#,##0.00", "en_US");
    BillBloc bloc = Provider.of<BillBloc>(context);

    Future<bool> confirmDismiss(direction) {
      if (direction == DismissDirection.endToStart)
        return Future<bool>.value(true);

      return Future<bool>.value(false);
    }

    void onDismissed() {
      Item item = Item(name: name, icon: icon, value: value);
      bloc.removeOneFixedBill(item);
    }

    return Dismissible(
      key: Key(name),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: BillIcon(icon: icon),
        title: Text(
          this.name,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          "R\$ ${formater.format(value)}",
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      confirmDismiss: confirmDismiss,
      background: Container(
        child: SizedBox(),
        color: Colors.white,
      ),
      secondaryBackground: Container(
        child: SizedBox(),
        color: Color(0xffff5555),
      ),
    );
  }
}
