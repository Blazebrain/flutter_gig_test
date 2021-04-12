import 'package:flutter/material.dart';

import '../screens/breaking_news_screen.dart';
import '../screens/search_screen.dart';
import '../utilities/changescreen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key key,
    @required this.model,
    @required this.isHome,
    @required this.isSearch,
  }) : super(key: key);
  final bool isHome;
  final bool isSearch;
  final model;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey[900],
        onTap: (value) {
          if (value == 0) {
            changeScreen(
                BreakingNewsScreen(
                  model: model,
                ),
                context);
          } else {
            changeScreen(
                SearchScreen(
                  model: model,
                ),
                context);
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: isHome == true ? Colors.blue[900] : Colors.grey[900],
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: isSearch == true ? Colors.blue[900] : Colors.grey[900],
              ),
              label: 'Search'),
        ]);
  }
}
