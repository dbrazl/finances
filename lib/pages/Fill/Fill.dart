import 'package:finances/bloc/BillBloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'components/Label.dart';
import 'components/SetFill.dart';

class Fill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BillBloc bloc = Provider.of<BillBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SetFill(),
              SizedBox(height: 50),
              FlatButton(
                child: Label(label: "Apagar contas fixas"),
                onPressed: bloc.removeFixedBills,
                height: 50,
              ),
              SizedBox(height: 10),
              FlatButton(
                child: Label(label: "Apagar contas variáveis"),
                onPressed: bloc.removeVariableBills,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
