import 'package:flow_chat/components/input_page.dart';
import 'package:flow_chat/components/radio_button.dart';
import 'package:flow_chat/models/radio_model.dart';
import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/navigations/main_top_tab.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterGender extends StatefulWidget {
  RegisterGender({
    @required this.next,
    @required this.user,
    @required this.userInputDone,
  });

  final Function next;
  final User user;
  final Function userInputDone;

  @override
  _RegisterGenderState createState() => _RegisterGenderState();
}

class _RegisterGenderState extends State<RegisterGender> {
  List<RadioModel> genderData = [];
  String pickGender;

  @override
  void initState() {
    super.initState();
    genderData.add(RadioModel(isSelected: false, label: '남'));
    genderData.add(RadioModel(isSelected: false, label: '여'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: inputPagePadding,
      child: InputPage(
        title: '성별',
        body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: genderData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 25),
              child: InkWell(
                onTap: () {
                  setState(() {
                    genderData.forEach((element) => element.isSelected = false);
                    genderData[index].isSelected = true;
                    pickGender = genderData[index].label;
                  });
                },
                child: RadioButton(
                  radioModel: genderData[index],
                ),
              ),
            );
          },
        ),
        buttonText: '완료',
        buttonOnPressed: (GlobalKey<FormState> key) async {
          if (pickGender != null) {
            String gender =
                pickGender == "남" ? Gender.male.value : Gender.female.value;
            widget.user.gender = gender;
            widget.userInputDone();
          } else {
            Get.snackbar(appName, "성별 선택은 필수 입니다.");
          }
        },
      ),
    );
  }
}
