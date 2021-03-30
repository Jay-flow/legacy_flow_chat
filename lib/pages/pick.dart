import 'package:flow/components/match_card.dart';
import 'package:flow/components/pick_bottom_icon_button.dart';
import 'package:flutter/material.dart';

class Pick extends StatelessWidget {
  static const String id = 'pick';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MatchCard(),
      bottomNavigationBar: PickBottomIconButton(),
    );
  }
}
