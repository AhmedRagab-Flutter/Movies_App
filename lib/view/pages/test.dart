import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.turned_in),
              title: Text("Saved"),
              selectedColor: Colors.pink,
            ),
          ],
        ),
        body: _currentIndex == 0
            ? Center(child: Text("home"))
            : _currentIndex == 1
                ? Center(child: Text("like"))
                : _currentIndex == 2
                    ? Center(child: Text("search"))
                    : Center(child: Text("peaple")));
  }
}
