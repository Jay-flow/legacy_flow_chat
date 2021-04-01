import 'dart:io' show Platform;

import 'package:flow_chat/components/login_button.dart';
import 'package:flow_chat/components/policy_info.dart';
import 'package:flow_chat/pages/register.dart';
import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  static const String name = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();
  }

  _appleLoginButton() {
    return LoginButton(
      icon: asset.Icons.icApple,
      onPressed: () {
        return _moveRegisterPage();
      },
      label: '애플 로그인',
      backgroundColor: asset.Colors.white,
    );
  }

  _faceLoginButton() {
    return LoginButton(
      icon: asset.Icons.icFacebook,
      onPressed: () {
        return _moveRegisterPage();
      },
      label: '페이스북 로그인',
      textColor: asset.Colors.white,
    );
  }

  _moveRegisterPage() => Get.toNamed(Register.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: gradientBackground,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: FadeTransition(
                    opacity: animation,
                    child: Text(
                      appName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                        textStyle: TextStyle(
                          fontSize: 110.0,
                          color: asset.Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  PolicyInfo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 30.0,
                    ),
                    child: SizedBox(
                      height: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Platform.isIOS
                              ? _appleLoginButton()
                              : _faceLoginButton(),
                          LoginButton(
                            icon: asset.Icons.icKakao,
                            onPressed: () {
                              return _moveRegisterPage();
                            },
                            label: '카카오 로그인',
                            textColor: asset.Colors.white,
                          ),
                          LoginButton(
                            icon: asset.Icons.icPhone,
                            onPressed: () {
                              return _moveRegisterPage();
                            },
                            label: '전화번호 로그인',
                            textColor: asset.Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
