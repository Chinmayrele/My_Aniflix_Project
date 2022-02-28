import 'dart:async';

import 'package:anime_netflix_clone/screens/home_page.dart';
import 'package:anime_netflix_clone/screens/my_list_screen.dart';
import 'package:anime_netflix_clone/screens/search_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  // const TabScreen({Key? key}) : super(key: key);
  final Timer timer;
  const TabScreen([this.timer]);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  final pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    HomePage(),
    const SearchScreen(1),
    MyListAnime(),
  ];
  @override
  Widget build(BuildContext context) {
    widget.timer.cancel();
    return Scaffold(
        body: PageView(
          children: _pages,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          onTap: (val) {
            pageController.jumpToPage(val);
            setState(() {
              _currentIndex = val;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "My List"),
          ],
        ));
  }
}
