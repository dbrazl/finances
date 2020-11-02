import 'package:finances/bloc/BillBloc.dart';
import 'package:flutter/material.dart';
import 'package:finances/components/BillList.dart';
import 'package:finances/components/Values.dart';
import 'package:provider/provider.dart';

import 'SettingButton.dart';

class VariableBills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BillBloc bloc = Provider.of<BillBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SettingButton(),
        Values(
          spend: bloc.getSpend(),
          rest: bloc.getRest(),
        ),
        SizedBox(
          height: 30,
        ),
        BillList(
          title: "despezas variáveis",
          items: bloc.getItemsVariables(),
        ),
      ],
    );
  }
}
