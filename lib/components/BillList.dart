import 'package:finances/models/Item.dart';
import 'package:flutter/material.dart';

import 'BillItem.dart';

class BillList extends StatelessWidget {
  String title;
  List<Item> items;

  BillList({@required this.title, @required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (items.length - 1 == index) {
                  return Column(children: [
                    BillItem(
                      icon: items[index].icon,
                      name: items[index].name,
                      value: items[index].value,
                    ),
                    SizedBox(height: 70),
                  ]);
                }

                return BillItem(
                  icon: items[index].icon,
                  name: items[index].name,
                  value: items[index].value,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
