import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/underline_text_field.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterJob extends StatefulWidget {
  RegisterJob({@required this.next});

  final Function next;

  @override
  _RegisterJobState createState() => _RegisterJobState();
}

class _RegisterJobState extends State<RegisterJob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kInputPagePadding,
      child: InputPage(
        title: '직업(전공)',
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            UnderlineTextField(
              validator: (String value) {
                if (value.length > 10)
                  return '직업 또는 전공이 너무깁니다. (10자 이하로 입력)';
                else
                  return null;
              },
              keyboardType: TextInputType.text,
              hintText: '직업 또는 전공을 입력해주세요.',
              onChanged: (name) => null,
              textValue: '',
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
          } else {}
        },
      ),
    );
  }
}
