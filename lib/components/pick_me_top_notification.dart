import 'package:flutter/material.dart';

class PickMeTopNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '나를 좋아하는 회원을 보려면\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'VIP ',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      height: 1.5,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '회원으로 업그레이드 해주세요.',
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
