import 'package:flow/components/ink_well_for_image.dart';
import 'package:flow/components/pick_me_profile_card.dart';
import 'package:flow/components/pick_me_top_notification.dart';
import 'package:flutter/material.dart';

class PickMe extends StatefulWidget {
  @override
  _PickMeState createState() => _PickMeState();
}

class _PickMeState extends State<PickMe> {
  // TODO:: Hero 애니메이션 넣어서 이미지 터치시 프로필 상세보기 구현
  // https://flutter.dev/docs/development/ui/animations/hero-animations
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            PickMeTopNotification(),
            InkWellForImage(
              child: Image.network(
                'https://t1.daumcdn.net/cfile/tistory/998CA2335A1D6B9208',
              ),
              onTap: () {},
            ),
          ]),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
          delegate: SliverChildListDelegate(
            List.generate(
              100,
              (index) {
                return InkWellForImage(
                  onTap: () {},
                  child: PickMeProfileCard(
                    profileImagePath:
                        'https://newsimg.hankookilbo.com/2019/10/24/201910241598062951_1.jpg',
                    nickName: '천재프로그래머',
                    remainDate: '남은 시간: 13:40',
                    isVIP: true,
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
