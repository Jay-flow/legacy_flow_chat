import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/underline_text_field.dart';
import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterNickname extends StatefulWidget {
  RegisterNickname({
    @required this.next,
    @required this.user,
  });

  final Function next;
  final User user;

  @override
  _RegisterNicknameState createState() => _RegisterNicknameState();
}

class _RegisterNicknameState extends State<RegisterNickname> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kInputPagePadding,
      child: InputPage(
        title: '닉네임',
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UnderlineTextField(
              validator: (String value) {
                if (value.length > 5)
                  return '닉네임이 너무깁니다. (5자 이하로 입력)';
                else
                  return null;
              },
              keyboardType: TextInputType.text,
              hintText: '닉네임을 입력해주세요.',
              onChanged: (name) => widget.user.name = name,
              textValue: widget.user.name,
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
        buttonText: '다음',
        buttonOnPressed: (GlobalKey<FormState> key) {
          if (key.currentState.validate()) {
            widget.next();
          }
        },
      ),
    );
  }
}
