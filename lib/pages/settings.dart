import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  static const String id = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
      ),
    );
  }
}
