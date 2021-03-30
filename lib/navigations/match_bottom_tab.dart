import 'package:flow/screens/message.dart';
import 'package:flow/screens/pick_me.dart';
import 'package:flutter/material.dart';

class MatchBottomTab extends StatefulWidget {
  static const String id = 'main_bottom_tab';

  @override
  _MatchBottomTabState createState() => _MatchBottomTabState();
}

class _MatchBottomTabState extends State<MatchBottomTab> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PickMe(),
    Message(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: _onTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.record_voice_over,
              size: 30.0,
            ),
            title: Text(
              'Pick Me',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.5),
              child: Icon(
                Icons.send,
                size: 30.0,
              ),
            ),
            title: Text(
              'Message',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          )
        ],
      ),
    );
  }
}
