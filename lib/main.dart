import 'package:flow_chat/pages/chat.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlowChat());
}

class FlowChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Asset.Colors.hotPink,
        accentColor: Asset.Colors.pastelGreen,
        primaryColorDark: Asset.Colors.blueBlack,
        primaryColorLight: Asset.Colors.skyBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey("Chat"),
            child: Chat(),
          )
        ],
        onPopPage: (router, result) => router.didPop(result),
      ),
    );
  }
}
