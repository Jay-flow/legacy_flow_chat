import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'constants.dart';

class FirebaseAuthentication {
  FirebaseAuthentication(
      {@required this.onSuccess,
      @required this.onFail,
      @required this.loadingStateChange});
  final Function onSuccess;
  final Function onFail;
  final Function loadingStateChange;

  static int inputLimitTimeSec = 60;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Function _updateLimitTime;
  String _verificationId;
  int inputLimitTime = inputLimitTimeSec;
  Timer _limitTimer;
  bool _isAlertRetrievalTimeout = true;

  set updateLimitTime(Function updateCallback) {
    _updateLimitTime = updateCallback;
  }

  Future<bool> _isExistUser() async {
    // Map<String, dynamic> userData =
    //     await user.getCloudUserData(user.phoneNumber);
    // if (userData != null) {
    //   return true;
    // }
    // return false;
  }

  _alreadyRegisteredUserHandling() async {
    Get.snackbar(appName, "이미 가입된 회원 정보가 있습니다.");
    // await user.localUserDataSave();
    // Navigator.pushReplacementNamed(context, PrayerInUs.id);
  }

  _phoneVerificationCompleted(PhoneAuthCredential credential) async {
    try {
      await _firebaseAuth.signInWithCredential(credential);
      _limitTimer.cancel();
      _isAlertRetrievalTimeout = false;
      // if (await _isExistUser()) return _alreadyRegisteredUserHandling();
      Get.snackbar(appName, "인증되었습니다.");
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        Get.snackbar(appName, "인증번호가 맞지 않습니다.\n한번더 확인 후 입력해주세요.");
      } else {
        _phoneAuthFail("인증과정 중 에러가 발생했습니다");
      }
    }
  }

  _phoneCodeSent(String verificationId, int resendToken) {
    _verificationId = verificationId;
    this.loadingStateChange(false);
    this.countDownLimitTime();
  }

  _phoneVerificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      _phoneAuthFail("잘못된 휴대폰 번호를 입력하셨습니다.");
    } else {
      _phoneAuthFail("인증과정 중 에러가 발생했습니다");
    }
  }

  _phoneCodeAutoRetrievalTimeout(String verificationId) {
    if (_isAlertRetrievalTimeout) {
      _phoneAuthFail(
          "인증 시간이 초과 되었습니다. 번호를 확인하신 후 재전송을 원할 경우 인증하기 버튼을 한번 더 클릭 해주세요.");
    }
  }

  phoneAuthMessage(String phoneNumber) async {
    this.loadingStateChange(true);
    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: '+82 $phoneNumber',
      timeout: Duration(seconds: inputLimitTime),
      verificationCompleted: _phoneVerificationCompleted,
      verificationFailed: _phoneVerificationFailed,
      codeSent: _phoneCodeSent,
      codeAutoRetrievalTimeout: _phoneCodeAutoRetrievalTimeout,
    )
        .catchError((e) {
      _phoneAuthFail("인증과정 중 에러가 발생했습니다");
    });
  }

  _phoneAuthFail(String message, {bool isCancelTimer = true}) {
    Get.snackbar(appName, message);
    this.onFail();
    if (isCancelTimer && _limitTimer != null) {
      this.inputLimitTime = inputLimitTimeSec;
      _limitTimer.cancel();
    }
  }

  void countDownLimitTime() {
    const oneSec = const Duration(seconds: 1);
    _limitTimer = new Timer.periodic(oneSec, (Timer timer) {
      if (this.inputLimitTime < 1) {
        this._limitTimer.cancel();
      } else {
        this.inputLimitTime -= 1;
        if (_updateLimitTime != null) {
          _updateLimitTime();
        }
      }
    });
  }

  verifyAuthNumber(String smsCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    await _phoneVerificationCompleted(credential);
  }
}
