import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          color: Color(0XFF213340),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              onPressed: null,
              tooltip: 'Home',
            ),
            IconButton(
              icon: Icon(CupertinoIcons.search, color: Colors.white),
              onPressed: null,
              tooltip: 'search',
            ),
            IconButton(
              icon: Icon(CupertinoIcons.heart_solid, color: Colors.white),
              onPressed: null,
              tooltip: 'Favorite',
            ),
          ],
        ));
  }
}

/*BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          fixedColor: Color(0XFF29D091),
          currentIndex: _bottomNavIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
          items: [
            new BottomNavigationBarItem(
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(CupertinoIcons.home)),
            new BottomNavigationBarItem(
                title: Text('search'), icon: Icon(CupertinoIcons.search)),
            new BottomNavigationBarItem(
                title: Text('bookmark'), icon: Icon(CupertinoIcons.bookmark)),
          ]),*/
