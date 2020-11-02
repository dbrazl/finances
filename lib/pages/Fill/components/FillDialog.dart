import 'package:finances/pages/AddBill/components/Input.dart';
import 'package:flutter/material.dart';

class FillDialog extends StatelessWidget {
  String fill;
  Function onChange;

  FillDialog({@required this.fill, @required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        'Informe a renda',
        textAlign: TextAlign.center,
      ),
      children: <Widget>[
        Input(
          placeholder: "R\$ $fill",
          onChange: onChange,
          type: TextInputType.number,
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, null);
          },
          child: Center(
            child: Container(
              child: Center(
                child: Text(
                  "Finalizar",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).buttonColor,
                  ),
                ),
              ),
              color: Theme.of(context).colorScheme.surface,
              width: 200,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
