import 'package:finances/pages/AddBill/AddBill.dart';
import 'package:finances/pages/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'bloc/BillBloc.dart';
import 'theme.dart';

import 'package:finances/components/NavigatorBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BillBloc>.value(
          value: BillBloc(),
        ),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finanças',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Home(),
          ),
          bottomNavigationBar: NavigatorBar(),
        ),
      ),
    );
  }
}
