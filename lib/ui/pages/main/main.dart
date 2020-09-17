import 'package:delicious/ui/pages/search/index.dart';
import 'package:flutter/material.dart';

import 'item.dart';

class MyMainPage extends StatefulWidget {
  static const String routerName = '/';
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _current,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        items: items,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MySearch.routerName);
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
