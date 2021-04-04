import 'package:flow_chat/components/button.dart';
import 'package:flow_chat/components/circle_icon_button.dart';
import 'package:flow_chat/components/circle_image.dart';
import 'package:flow_chat/mocks/user.dart';
import 'package:flow_chat/views/settings.dart';
import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class My extends StatefulWidget {
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: CircleImage(
                    imagePath: UserMock.user.profileImagePath,
                  ),
                ),
                Text(
                  UserMock.user.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${UserMock.user.job}, ${UserMock.user.age}살",
                ),
              ],
            ),
            Container(
              height: 180,
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
                      color: asset.Colors.grey,
                      activeColor: Theme.of(context).accentColor,
                    ),
                  ),
                  loop: true,
                  autoplay: true,
                  layout: SwiperLayout.DEFAULT,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: CircleIconButton(
                    icon: Icons.settings,
                    onPressed: () => Get.toNamed(Settings.name),
                  ),
                ),
                Container(
                  child: CircleIconButton(
                    icon: Icons.camera_alt,
                    onPressed: () => _pictureChange(),
                  ),
                ),
                Container(
                  child: CircleIconButton(
                    icon: Icons.edit,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Button(
                buttonColor: Theme.of(context).primaryColor,
                onPressed: () {},
                buttonText: 'VIP 회원 신청',
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
