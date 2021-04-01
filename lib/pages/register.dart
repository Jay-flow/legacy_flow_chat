import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_chat/components/loading_container.dart';
import 'package:flow_chat/models/user.dart' as model;
import 'package:flow_chat/navigations/main_top_tab.dart';
import 'package:flow_chat/pages/register_phone_auth.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flow_chat/utils/firebase_authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_age.dart';
import 'register_gender.dart';
import 'register_job.dart';
import 'register_nickname.dart';
import 'register_phone_number.dart';

class Register extends StatefulWidget {
  static const String name = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  model.User user = model.User();
  bool _isLoading = false;
  List<Widget> pages;
  final PageController _pageController = PageController();
  double progressValue;

  void _loadingStateChange(isLoading) => setState(() => _isLoading = isLoading);

  void _nextPage() {
    _pageController.nextPage(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
    );
  }

  void _onFailAuth() {
    _previousPage();
    setState(() {
      _isLoading = false;
    });
  }

  void userInputDone() {
    print(user);
    // Get.toNamed(MainTopTab.name);
  }

  void _previousPage() {
    _pageController.previousPage(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication(
      onSuccess: _nextPage,
      onFail: _onFailAuth,
      loadingStateChange: _loadingStateChange,
    );
    pages = [
      RegisterPhoneNumber(
        next: _nextPage,
        phoneAuthMessage: firebaseAuthentication.phoneAuthMessage,
        user: user,
      ),
      RegisterPhoneAuth(
        next: _nextPage,
        firebaseAuthentication: firebaseAuthentication,
      ),
      RegisterNickname(
        next: _nextPage,
        user: user,
      ),
      RegisterJob(
        next: _nextPage,
        user: user,
      ),
      RegisterAge(
        next: _nextPage,
        user: user,
      ),
      RegisterGender(
        next: _nextPage,
        user: user,
        userInputDone: userInputDone,
      ),
    ];
    progressValue = 1.0 / pages.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoadingContainer(
          isLoading: _isLoading,
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
                    FocusScope.of(context).unfocus();
                    setState(() {
                      progressValue = (currentPosition + 1) / pages.length;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
