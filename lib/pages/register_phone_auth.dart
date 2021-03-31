import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/underline_text_field.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPhoneAuth extends StatefulWidget {
  RegisterPhoneAuth({
    @required this.next,
    @required this.verifyAuthNumber,
  });

  final Function next;
  final Function verifyAuthNumber;

  @override
  _RegisterPhoneAuthState createState() => _RegisterPhoneAuthState();
}

class _RegisterPhoneAuthState extends State<RegisterPhoneAuth> {
  String authNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kInputPagePadding,
      child: InputPage(
        title: '인증 번호',
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UnderlineTextField(
              validator: (String value) {
                if (value == '') return '인증 번호를 입력해주세요';
                return null;
              },
              keyboardType: TextInputType.phone,
              hintText: '인증 번호를 입력해주세요',
              onChanged: (authNumber) => this.authNumber = authNumber.trim(),
              textValue: '',
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
            widget.verifyAuthNumber(this.authNumber);
          }
        },
      ),
    );
  }
}
