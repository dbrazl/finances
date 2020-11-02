import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class NavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          child: Image.asset(
            "assets/icons/bill.png",
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
        Tab(
          child: Image.asset(
            "assets/icons/coins.png",
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
      ],
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Color(0xff808080),
      indicatorPadding: EdgeInsets.all(5),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Theme.of(context).primaryColor,
    );
  }
}
