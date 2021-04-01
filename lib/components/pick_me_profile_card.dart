import 'dart:ui';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';

class PickMeProfileCard extends StatelessWidget {
  PickMeProfileCard({
    @required this.profileImagePath,
    @required this.nickName,
    @required this.remainDate,
    @required this.isVIP,
  });

  final String profileImagePath;
  final String nickName;
  final String remainDate;
  final bool isVIP;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: loadingImagePath,
              image: profileImagePath,
            ),
            isVIP
                ? Container()
                : BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                color: Colors.black.withOpacity(0.3),
                child: isVIP
                    ? Text(
                        nickName,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        remainDate,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
