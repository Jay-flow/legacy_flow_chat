import 'package:flutter/material.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;

class SendMessageLayout extends StatefulWidget {
  final Function sendMessage;

  SendMessageLayout({
    this.sendMessage,
  });

  @override
  _SendMessageLayoutState createState() => _SendMessageLayoutState();
}

class _SendMessageLayoutState extends State<SendMessageLayout> {
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sendButtonWidth = 80;
    final deviceWidth = MediaQuery.of(context).size.width;
    final inputMessageWidth = deviceWidth - sendButtonWidth;

    return GestureDetector(
      onTap: () => widget.sendMessage(messageController.text),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 150,
        ),
        color: Theme.of(context).accentColor,
        child: Stack(
          children: [
            Container(
              width: inputMessageWidth,
              color: Asset.Colors.grey,
              child: TextFormField(
                controller: messageController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter your message",
                ),
                maxLines: null,
              ),
            ),
            Positioned(
              left: inputMessageWidth,
              bottom: 10,
              child: Container(
                width: sendButtonWidth.toDouble(),
                height: 25,
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxHeight: 150,
                ),
                child: Text(
                  "Send",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
