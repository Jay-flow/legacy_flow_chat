import 'dart:io' show Platform;

import 'package:flow_chat/components/login_button.dart';
import 'package:flow_chat/components/policy_info.dart';
import 'package:flow_chat/pages/register.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

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
      icon: Asset.Icons.icApple,
      onPressed: () {
        return _moveRegisterPage();
      },
      label: '애플 로그인',
      backgroundColor: Asset.Colors.white,
    );
  }

  _faceLoginButton() {
    return LoginButton(
      icon: Asset.Icons.icFacebook,
      onPressed: () {
        return _moveRegisterPage();
      },
      label: '페이스북 로그인',
      textColor: Asset.Colors.white,
    );
  }

  _moveRegisterPage() => Navigator.pushReplacementNamed(context, Register.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  child: FadeTransition(
                    opacity: animation,
                    child: Text(
                      kAppName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dancingScript(
                        textStyle: TextStyle(
                          fontSize: 110.0,
                          color: Asset.Colors.white,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Platform.isIOS
                            ? _appleLoginButton()
                            : _faceLoginButton(),
                        SizedBox(
                          height: 20,
                        ),
                        LoginButton(
                          icon: Asset.Icons.icKakao,
                          onPressed: () {
                            return _moveRegisterPage();
                          },
                          label: '카카오 로그인',
                          textColor: Asset.Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
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
