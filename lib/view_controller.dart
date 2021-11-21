import 'package:flutter/material.dart';
import 'package:pvd_things_app/views/browse.dart';
import 'package:pvd_things_app/views/me.dart';
import 'package:pvd_things_app/views/polls.dart';

class ViewController extends StatefulWidget {
  const ViewController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewControllerState();
  }
}

class _ViewControllerState extends State<ViewController> {
  int _selectedPage = 0;
  static const List<Widget> _pages = <Widget>[
    BrowsePage(),
    PollsPage(),
    MePage(),
  ];

  void _updatePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages.elementAt(_selectedPage),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.handyman_outlined),
          activeIcon: Icon(Icons.handyman),
          label: "Things",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.how_to_vote_outlined),
          activeIcon: Icon(Icons.how_to_vote),
          label: "Polls",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: "Me",
        )
      ],
      currentIndex: _selectedPage,
      onTap: _updatePage,
    );
  }
}
