import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flow_chat/utils/asset.dart' as asset;

import 'button.dart';

class InputPage extends StatefulWidget {
  InputPage({
    this.key,
    @required this.title,
    @required this.buttonText,
    @required this.buttonOnPressed,
    @required this.body,
  });

  final Key key;
  final String title;
  final String buttonText;
  final Function buttonOnPressed;
  final Widget body;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  String value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: titleTextStyle.copyWith(
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.normal,
            ),
          ),
          Expanded(
            child: Center(
              child: widget.body,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Button(
              onPressed: () => widget.buttonOnPressed(_formKey),
              buttonText: widget.buttonText,
              buttonColor: asset.Colors.white,
              textColor: asset.Colors.blueBlack,
            ),
          )
        ],
      ),
    );
  }
}
