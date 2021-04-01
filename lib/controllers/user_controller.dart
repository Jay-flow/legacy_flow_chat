import 'package:flow_chat/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = User().obs;

  updateUser(User inputUser) {
    user.update((val) {
      val = inputUser;
    });
  }
}
