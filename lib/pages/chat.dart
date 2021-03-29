import 'package:flow_chat/components/chat_message_layout.dart';
import 'package:flow_chat/components/send_message_layout.dart';
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
          userName: "Jay-flow",
          message: controller.text,
          isMe: true,
        ),
      );
      controller.text = "";
    });
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
