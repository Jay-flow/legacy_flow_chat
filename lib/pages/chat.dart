import 'package:flow_chat/components/chat_message_layout.dart';
import 'package:flow_chat/components/send_message_layout.dart';
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void sendMessage(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ChatMessageLayout(
                      userImagePath: testProfileImage1,
                      userName: "Jay-flow",
                      message: testMessage1,
                    )
                  ],
                ),
              ),
            ),
            SendMessageLayout(
              sendMessage: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
