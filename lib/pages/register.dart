import 'package:flow/screens/register_age.dart';
import 'package:flow/screens/register_gender.dart';
import 'package:flow/screens/register_job.dart';
import 'package:flow/screens/register_nickname.dart';
import 'package:flow/screens/register_phone_number.dart';
import 'package:flow/utils/asset.dart' as Asset;
import 'package:flow/utils/settings.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<Widget> pages;
  final PageController _pageController = PageController();
  double progressValue;

  void nextPage() {
    _pageController.nextPage(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void initState() {
    super.initState();
    setStatusBarColor();
    pages = [
      RegisterPhoneNumber(next: nextPage),
      RegisterNickname(next: nextPage),
      RegisterJob(next: nextPage),
      RegisterAge(next: nextPage),
      RegisterGender(next: nextPage),
    ];
    progressValue = 1.0 / pages.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Asset.Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: PageView.builder(
//                  physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, position) {
                  return pages[position];
                },
                itemCount: pages.length,
                onPageChanged: (currentPosition) {
                  setState(() {
                    progressValue = (currentPosition + 1) / pages.length;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}