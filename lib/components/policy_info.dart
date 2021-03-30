import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PolicyInfo extends StatelessWidget {
  _moveTermsAndConditions() {
    // TODO:: 이용약관 페이지로 이동
  }

  _movePrivacyPolicy() {
    // TODO:: 개인정보 취침방침 페이지로 이동
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(fontSize: 15.5),
        children: [
          TextSpan(
            text: '로그인함으로써 ',
          ),
          TextSpan(
              text: '이용약관',
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = _moveTermsAndConditions),
          TextSpan(
            text: ' 및\n',
          ),
          TextSpan(
            text: '개인정보',
            style: TextStyle(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = _movePrivacyPolicy,
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: '취급방침',
            style: TextStyle(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = _movePrivacyPolicy,
          ),
          TextSpan(
            text: '에 동의합니다.',
          ),
        ],
      ),
    );
  }
}
