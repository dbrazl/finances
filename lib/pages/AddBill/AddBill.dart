import 'package:finances/bloc/BillBloc.dart';
import 'package:finances/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'components/Dropdown.dart';
import 'components/Input.dart';

class AddBill extends StatefulWidget {
  String name;
  String billType = 'Despeza variável';
  double value;

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  @override
  Widget build(BuildContext context) {
    final BillBloc bloc = Provider.of<BillBloc>(context);

    void onChangeName(String value) {
      setState(() {
        widget.name = value;
      });
    }

    void onChangeBillType(String value) {
      setState(() {
        widget.billType = value;
      });
    }

    void onChangeValue(String value) {
      var newValue = double.tryParse(value);

      if (newValue != null) {
        setState(() {
          widget.value = newValue;
        });
      } else {
        setState(() {
          widget.value = 0;
        });
      }
    }

    void submit() {
      Map<String, dynamic> item = {
        "name": widget.name,
        "type": widget.billType,
        "value": widget.value,
      };

      bloc.setItem(item);

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nova despeza",
              style: TextStyle(
                fontSize: 32,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Input(
                      placeholder: "Nome da despeza",
                      type: TextInputType.text,
                      onChange: onChangeName,
                    ),
                    SizedBox(height: 30),
                    Dropdown(
                        onChange: onChangeBillType, value: widget.billType),
                    SizedBox(height: 30),
                    Input(
                      placeholder: "Valor",
                      type: TextInputType.number,
                      onChange: onChangeValue,
                      value: widget.value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Feather.save,
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
        onPressed: submit,
      ),
    );
  }
}
