import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/underline_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPhoneNumber extends StatefulWidget {
  RegisterPhoneNumber({@required this.next});

  final Function next;

  @override
  _RegisterPhoneNumberState createState() => _RegisterPhoneNumberState();
}

class _RegisterPhoneNumberState extends State<RegisterPhoneNumber> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _isLoading = false;

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
                if (value == '')
                  return '번호를 입력해주세요';
                else
                  return null;
              },
              keyboardType: TextInputType.phone,
              hintText: '휴대폰 번호를 입력해주세요 (\'-\'제외)',
              onChanged: (phoneNumber) => null,
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
//            if (_isPhoneAuth) {
//              if (key.currentState.validate()) {
//                _phoneAuthMessage();
//              }
//            } else {
//              nextPage();
//            }
        },
      ),
    );
  }
}
