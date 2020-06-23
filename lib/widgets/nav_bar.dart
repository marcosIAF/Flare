import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flare/screens/About.dart';
import 'package:flare/screens/Home_page.dart';
import 'package:flutter/material.dart';

import 'Search.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Colors.amber,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.games,
            label: 'Games',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Search',
          ),
          FFNavigationBarItem(
            iconData: Icons.info_outline,
            label: 'About',
          ),
        ],
      ),
      body: itemchanger(selectedIndex),
    );
  }
}

Widget itemchanger(int value) {
  switch (value) {
    case 0:
      return HomePage();
      break;
    case 1:
      return Search();
      break;
    case 2:
      return About();
      break;
    default:
      return HomePage();
  }
}
