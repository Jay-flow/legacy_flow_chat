import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/underline_text_field.dart';
import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPhoneNumber extends StatefulWidget {
  RegisterPhoneNumber({
    @required this.next,
    @required this.phoneAuthMessage,
    @required this.user
  });

  final Function next;
  final Function phoneAuthMessage;
  final User user;

  @override
  _RegisterPhoneNumberState createState() => _RegisterPhoneNumberState();
}

class _RegisterPhoneNumberState extends State<RegisterPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kInputPagePadding,
      child: InputPage(
        title: '휴대폰 번호',
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UnderlineTextField(
              validator: (String value) {
                if (value == '') return '번호를 입력해주세요';
                return null;
              },
              keyboardType: TextInputType.phone,
              hintText: '휴대폰 번호를 입력해주세요 (\'-\'제외)',
              onChanged: (phoneNumber) {
                widget.user.phoneNumber = phoneNumber.trim();
              },
              textValue: widget.user.phoneNumber,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
        buttonText: '인증하기',
        buttonOnPressed: (GlobalKey<FormState> key) {
          if (key.currentState.validate()) {
            widget.phoneAuthMessage(widget.user.phoneNumber);
            widget.next();
          }
        },
      ),
    );
  }
}
