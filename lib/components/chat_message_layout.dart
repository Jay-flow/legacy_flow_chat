import 'package:flutter/material.dart';

import 'circle_image.dart';

class ChatMessageLayout extends StatelessWidget {
  final String message;
  final String userName;
  final String userImagePath;

  ChatMessageLayout({this.message, this.userName, this.userImagePath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleImage(
          size: 50,
          imagePath: this.userImagePath,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  this.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    this.message,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
