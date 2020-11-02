import 'dart:convert';

import 'package:finances/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillBloc extends ChangeNotifier {
  double _fill = 0;
  double _spend = 0;
  double _rest = 0;
  List<Item> items = [];
  List<Map<String, dynamic>> icons = [
    {
      "name": ["cartão", "cartao"],
      "asset": "assets/icons/credit-card.png",
    },
    {
      "name": ["faculdade", "graduação", "graduacao", "college"],
      "asset": "assets/icons/school.png",
    },
    {
      "name": ["supermercado", "mercado", "sacolão", "sacolao"],
      "asset": "assets/icons/shopping-cart.png",
    },
    {
      "name": ["loja"],
      "asset": "assets/icons/shopping-bag.png",
    },
    {
      "name": [
        "esporte",
        "basquete",
        "taekwondo",
        "atletismo",
        "natação",
        "volei",
        "box",
        "muay thay"
      ],
      "asset": "assets/icons/ball.png",
    },
    {
      "name": ["academia", "treino"],
      "asset": "assets/icons/gym.png",
    },
    {
      "name": ["apartamento", "casa"],
      "asset": "assets/icons/building.png",
    },
  ];

  BillBloc() {
    load();
    _rest = _fill - _spend;
  }

  setFill(double value) {
    _fill = value;
    setRest();
    save();
    notifyListeners();
  }

  setSpend(double value) {
    _spend = value;
    save();
    notifyListeners();
  }

  setRest() {
    _rest = _fill - _spend;
    save();
    notifyListeners();
  }

  String _getIcon(String name) {
    String icon = "assets/icons/hexagon.png";

    icons.forEach((element) {
      element['name'].forEach((value) {
        String nameLowerCase = name.toLowerCase();
        String keyWordLowerCase = value.toLowerCase();

        print("${nameLowerCase.contains(keyWordLowerCase)}");
        if (nameLowerCase.contains(keyWordLowerCase)) {
          icon = element["asset"];
        }
      });
    });

    return icon;
  }

  setItem(Map<String, dynamic> item) {
    String type = item['type'] == 'Despeza variável' ? 'variable' : 'fixed';
    String icon = _getIcon(item['name']);

    Item newItem = Item(
      icon: icon,
      name: item['name'],
      type: type,
      value: item['value'],
    );

    items.add(newItem);
    setSpend(this._spend + item['value']);
    setRest();
  }

  getSpend() {
    return this._spend;
  }

  getRest() {
    return this._rest;
  }

  getFill() {
    return this._fill;
  }

  getItemsFixed() {
    List<Item> items = this.items.map((e) {
      if (e.type == "fixed") {
        return e;
      }
    }).toList();

    items.removeWhere((value) => value == null);

    return items;
  }

  getItemsVariables() {
    List<Item> items = this.items.map((e) {
      if (e.type == 'variable') {
        return e;
      }
    }).toList();

    items.removeWhere((value) => value == null);

    return items;
  }

  void save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(items));
    await prefs.setString('fill', jsonEncode(_fill));
    await prefs.setString('spend', jsonEncode(_spend));
    await prefs.setString('rest', jsonEncode(_rest));
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    var fill = prefs.getString('fill');
    var spend = prefs.getString('spend');
    var rest = prefs.getString('rest');

    if (data != null) {
      Iterable decoded = jsonDecode(data);

      List<Item> items = decoded.map((item) => Item.fromJson(item)).toList();

      this.items = items;
    }

    if (fill != null) {
      this.setFill(double.parse(fill));
    }

    if (spend != null) {
      this.setSpend(double.parse(spend));
    }

    if (rest != null) {
      this._rest = double.parse(rest);
      notifyListeners();
    }
  }

  void removeOneFixedBill(Item item) {
    double spend = this._spend - item.value;
    setSpend(spend);
    setRest();
    items.removeWhere((element) => element.name == item.name);
  }

  void removeFixedBills() {
    items.forEach((item) {
      if (item.type == 'fixed') {
        double spend = this._spend - item.value;
        setSpend(spend);
        setRest();
      }
    });

    items.removeWhere((element) => element.type == 'fixed');
  }

  void removeVariableBills() {
    items.forEach((item) {
      if (item.type == 'variable') {
        double spend = this._spend - item.value;
        setSpend(spend);
        setRest();
      }
    });

    items.removeWhere((element) => element.type == 'variable');
  }
}
