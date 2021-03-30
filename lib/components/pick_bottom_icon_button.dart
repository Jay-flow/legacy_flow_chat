import 'package:flow_chat/components/circle_icon_button.dart';
import 'package:flutter/material.dart';

class PickBottomIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleIconButton(
              icon: Icons.refresh,
              iconSize: 17.0,
              iconColor: Theme.of(context).primaryColorLight,
              onPressed: () {},
            ),
            CircleIconButton(
              icon: Icons.clear,
              iconColor: Theme.of(context).accentColor,
              onPressed: () {},
            ),
            CircleIconButton(
              icon: Icons.favorite,
              iconColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            CircleIconButton(
              icon: Icons.send,
              iconSize: 17.0,
              iconColor: Theme.of(context).primaryColorLight,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
