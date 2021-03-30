import 'package:flow/models/user.dart';

class UserMock {
  UserMock._();

  static User user = User(
    nickName: '천재개발자',
    profileImagePath:
        'https://www.sports-g.com/wp-content/uploads/2019/03/%EC%86%8C%EB%85%80%EC%8B%9C%EB%8C%80-%ED%83%9C%EC%97%B0.jpg',
    job: 'Programmer',
    age: 29,
  );
}
