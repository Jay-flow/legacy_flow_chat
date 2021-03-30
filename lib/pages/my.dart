import 'package:flow_chat/components/button.dart';
import 'package:flow_chat/components/circle_icon_button.dart';
import 'package:flow_chat/components/circle_image.dart';
import 'package:flow_chat/mocks/user.dart';
import 'package:flow_chat/pages/settings.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class My extends StatefulWidget {
  static const String id = 'my';

  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  _pictureChange() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('카메라 찍기'),
                onTap: () async {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.perm_media),
                title: Text('갤러리에서 가져오기'),
                onTap: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: CircleImage(
                imagePath: UserMock.user.profileImagePath,
              ),
            ),
            Text(
              UserMock.user.nickName,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "${UserMock.user.job}, ${UserMock.user.age}살",
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            "https://i.ytimg.com/vi/4OrCA1OInoo/maxresdefault.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                        itemHeight: 100.0,
                        itemWidth: 100.0,
                        itemCount: 3,
                        pagination: SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            color: Asset.Colors.grey,
                            activeColor: Theme.of(context).accentColor,
                          ),
                        ),
                        loop: true,
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 50.0, left: 15.0),
                          child: CircleIconButton(
                            icon: Icons.settings,
                            onPressed: () => Navigator.pushNamed(
                              context,
                              Settings.id,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50.0),
                          child: CircleIconButton(
                            icon: Icons.camera_alt,
                            onPressed: () => _pictureChange(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 50.0, right: 15.0),
                          child: CircleIconButton(
                            icon: Icons.edit,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Button(
              buttonColor: Theme.of(context).primaryColor,
              onPressed: () {},
              buttonText: 'VIP 회원 신청',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
