import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_chat/components/loading_container.dart';
import 'package:flow_chat/pages/register_phone_auth.dart';

import 'register_age.dart';
import 'register_gender.dart';
import 'register_job.dart';
import 'register_phone_number.dart';
import 'register_nickname.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
int INPUT_LIMIT_TIME = 60;

class Register extends StatefulWidget {
  static const String name = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isLoading = false;
  List<Widget> pages;
  final PageController _pageController = PageController();
  double progressValue;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId;
  int _inputLimitTime = INPUT_LIMIT_TIME;
  Timer _timer;
  bool _isAlreadyRegister = false;

  Future<bool> _isExistUser() async {
    // Map<String, dynamic> userData =
    //     await user.getCloudUserData(user.phoneNumber);
    // if (userData != null) {
    //   return true;
    // }
    // return false;
  }

  _alreadyRegisteredUserHandling() async {
    _isAlreadyRegister = true;
    // Fluttertoast.showToast(
    //   msg: "이미 가입된 회원 정보가 있습니다.",
    //   toastLength: Toast.LENGTH_LONG,
    //   backgroundColor: kToastBackgroundColor,
    // );
    // await user.localUserDataSave();
    // Navigator.pushReplacementNamed(context, PrayerInUs.id);
  }

  _phoneVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
      if (await _isExistUser()) return _alreadyRegisteredUserHandling();
      // Fluttertoast.showToast(
      //   msg: '인증되었습니다.',
      //   backgroundColor: kToastBackgroundColor,
      // );
      // nextPage();
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        // Fluttertoast.showToast(
        //   msg: "인증번호가 맞지 않습니다. 한번더 확인 후 입력해주세요.",
        //   backgroundColor: kToastBackgroundColor,
        // );
      } else {
        _phoneAuthFail("인증과정 중 에러가 발생했습니다");
      }
    }
  }

  _phoneCodeSent(String verificationId, int resendToken) {
    _verificationId = verificationId;
    _loadingStateChange(false);
  }

  _phoneVerificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      _loadingStateChange(false);
      // Fluttertoast.showToast(
      //   msg: '잘못된 휴대폰 번호를 입력하셨습니다.',
      //   backgroundColor: kToastBackgroundColor,
      // );
    } else {
      _phoneAuthFail("인증과정 중 에러가 발생했습니다");
    }
  }

  _phoneCodeAutoRetrievalTimeout(String verificationId) {
    if (!_isAlreadyRegister) {
      _phoneAuthFail(
          "인증 시간이 초과 되었습니다. 번호를 확인하신 후 재전송을 원할 경우 인증하기 버튼을 한번 더 클릭 해주세요.");
    }
  }

  _phoneAuthMessage(String phoneNumber) async {
    _loadingStateChange(true);
    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: '+82 $phoneNumber',
      timeout: Duration(seconds: INPUT_LIMIT_TIME),
      verificationCompleted: _phoneVerificationCompleted,
      verificationFailed: _phoneVerificationFailed,
      codeSent: _phoneCodeSent,
      codeAutoRetrievalTimeout: _phoneCodeAutoRetrievalTimeout,
    )
        .catchError((e) {
      _phoneAuthFail("인증과정 중 에러가 발생했습니다");
    });
  }

  _phoneAuthFail(String message) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   backgroundColor: kToastBackgroundColor,
    // );
    _previousPage();
    _timer.cancel();
    _inputLimitTime = INPUT_LIMIT_TIME;
  }

  void _loadingStateChange(isLoading) => setState(() => _isLoading = isLoading);

  void _inputLimitTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_inputLimitTime < 1) {
            timer.cancel();
          } else {
            _inputLimitTime = _inputLimitTime - 1;
          }
        },
      ),
    );
  }

  _verifyAuthNumber(String smsCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    await _phoneVerificationCompleted(credential);
    _timer.cancel();
  }

  void nextPage() {
    _pageController.nextPage(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 200),
    );
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

    pages = [
      RegisterPhoneNumber(
        next: nextPage,
        phoneAuthMessage: _phoneAuthMessage,
        inputLimitTimer: _inputLimitTimer,
      ),
      RegisterPhoneAuth(
        next: nextPage,
        verifyAuthNumber: _verifyAuthNumber,
      ),
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
