import 'package:flow_chat/components/circle_image.dart';
import 'package:flow_chat/mocks/user.dart';
import 'package:flow_chat/views/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List users = ["hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi", "hi"];
  final double imageSize = 70;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "New Matches",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: index == 0 ? 0 : 5,
                                bottom: 3,
                                right: index + 1 == users.length ? 0 : 5,
                              ),
                              child: CircleImage(
                                imagePath: UserMock.user.profileImagePath,
                                size: imageSize,
                              ),
                            ),
                            Text(
                              UserMock.user.name,
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Messages",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => Get.toNamed(Chat.name),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                right: 10,
                              ),
                              child: CircleImage(
                                imagePath: UserMock.user.profileImagePath,
                                size: imageSize,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    UserMock.user.name,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                      UserMock.user.profileImagePath,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
