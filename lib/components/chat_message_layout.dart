import 'package:flutter/material.dart';
import 'circle_image.dart';

class ChatMessageLayout extends StatelessWidget {
  final String message;
  final String userName;
  final String userImagePath;
  final bool isMe;

  ChatMessageLayout({
    @required this.message,
    @required this.userName,
    this.isMe = false,
    this.userImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final profileImage = isMe
        ? SizedBox.shrink()
        : CircleImage(
            size: 50,
            imagePath: this.userImagePath,
          );
    final alignment = isMe ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        profileImage,
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 1.5,
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
