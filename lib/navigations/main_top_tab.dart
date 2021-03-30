import 'package:flow_chat/pages/my.dart';
import 'package:flow_chat/pages/pick.dart';
import 'package:flutter/material.dart';

import 'match_bottom_tab.dart';

class MainTopTab extends StatefulWidget {
  static const String id = 'main_top_tab';

  @override
  _MainTopTabState createState() => _MainTopTabState();
}

class _MainTopTabState extends State<MainTopTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Widget> topMenuWidgets = <Widget>[
    My(),
    Pick(),
    MatchBottomTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: topMenuWidgets.length,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            height: double.infinity,
            child: TabBar(
              controller: _tabController,
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.filter,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.chat,
                  ),
                ),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: topMenuWidgets,
      ),
    );
  }
}
