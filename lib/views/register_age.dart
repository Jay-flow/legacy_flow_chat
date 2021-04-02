import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class RegisterAge extends StatefulWidget {
  RegisterAge({
    @required this.next,
    @required this.user,
  });

  final Function next;
  final User user;

  @override
  _RegisterAgeState createState() => _RegisterAgeState();
}

class _RegisterAgeState extends State<RegisterAge> {
  int _currentPickAge = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: InputPage(
        title: "나이",
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              NumberPicker(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1.0,
                      color: asset.Colors.grey,
                    ),
                    bottom: BorderSide(
                      width: 1.0,
                      color: asset.Colors.grey,
                    ),
                  ),
                ),
                value: _currentPickAge,
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
        ),
        buttonText: '다음',
        buttonOnPressed: (GlobalKey<FormState> key) {
          if (key.currentState.validate()) {
            widget.user.age = _currentPickAge;
            widget.next();
          } else {}
        },
      ),
    );
  }
}
