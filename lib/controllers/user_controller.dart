import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_chat/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final user = User().obs;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  updateUser(User inputUser) {
    user.value = inputUser;
  }

  Future<void> localUserDataSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', user.value.phoneNumber);
  }

  Future<void> cloudUserDataSave() async {
    await userCollection.doc(user.value.phoneNumber).set({
      'name': user.value.name,
      'profileImagePath': user.value.profileImagePath,
      'phoneNumber': user.value.phoneNumber,
      'socialToken': user.value.socialToken,
      'gender': user.value.gender,
      'age': user.value.age,
      'job': user.value.job,
      'authCode': user.value.authCode,
      'authToken': user.value.authToken,
      'refreshToken': user.value.refreshToken,
      'deviceToken': user.value.deviceToken,
      'createdAt': Timestamp.now(),
      'startedAt': Timestamp.now(),
    });
  }
}
