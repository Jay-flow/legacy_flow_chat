import 'package:flow/components/input_page.dart';
import 'package:flow/utils/asset.dart' as Asset;
import 'package:flow/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class RegisterAge extends StatefulWidget {
  RegisterAge({@required this.next});

  final Function next;

  @override
  _RegisterAgeState createState() => _RegisterAgeState();
}

class _RegisterAgeState extends State<RegisterAge> {
  int _currentPickAge = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kInputPagePadding,
      child: InputPage(
        title: "나이",
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NumberPicker.integer(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Asset.Colors.grey,
                  ),
                  bottom: BorderSide(
                    width: 1.0,
                    color: Asset.Colors.grey,
                  ),
                ),
              ),
              initialValue: _currentPickAge,
              minValue: 15,
              maxValue: 70,
              onChanged: (newValue) => setState(
                () => _currentPickAge = newValue,
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
        buttonText: '다음',
        buttonOnPressed: (GlobalKey<FormState> key) {
          if (key.currentState.validate()) {
            widget.next();
          } else {}
        },
      ),
    );
  }
}