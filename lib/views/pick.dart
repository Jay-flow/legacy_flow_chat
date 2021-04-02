import 'package:flow_chat/components/match_card.dart';
import 'package:flow_chat/components/pick_bottom_icon_button.dart';
import 'package:flutter/material.dart';

class Pick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MatchCard(),
      ),
      bottomNavigationBar: PickBottomIconButton(),
    );
  }
}
