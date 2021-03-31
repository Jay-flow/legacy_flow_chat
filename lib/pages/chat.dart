import 'package:flow_chat/components/chat_message_layout.dart';
import 'package:flow_chat/components/send_message_layout.dart';
import 'package:flow_chat/mocks/user.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Widget> messages = [];

  void sendMessage(TextEditingController controller) {
    setState(() {
      messages.add(
        ChatMessageLayout(
          userName: UserMock.user.nickName,
          message: controller.text,
          isMe: true,
        ),
      );
      controller.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      reverse: true,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: messages,
                        ),
                      ),
                    );
                  },
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
