import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_chat/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final user = User().obs;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  updateUser(User inputUser) => user.value = inputUser;

  Future<String> getLocalUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<void> setLocalUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', user.value.uid);
  }

  Future<void> cloudUserDataSave(String uid) async {
    await userCollection.doc(uid).set({
      'uid': user.value.uid,
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

  Future<Map<String, dynamic>> getCloudUserData(String uid) async {
    DocumentSnapshot user = await userCollection.doc(uid).get();
    return user.data();
  }

  setUserListener(String uid) async {
    DocumentSnapshot user = await userCollection.doc(uid).get();
    user.reference.snapshots().listen((event) {
      if (event.data() != null) {
        this.setUser(event.data());
      }
    });
  }

  setUser(userData) {
    user.value.uid = userData['uid'];
    user.value.name = userData['name'];
    user.value.profileImagePath = userData['profileImagePath'];
    user.value.phoneNumber = userData['phoneNumber'];
    user.value.socialToken = userData['socialToken'];
    user.value.gender = userData['gender'];
    user.value.age = userData['age'];
    user.value.job = userData['job'];
    user.value.authCode = userData['authCode'];
    user.value.authToken = userData['authToken'];
    user.value.refreshToken = userData['refreshToken'];
    user.value.deviceToken = userData['deviceToken'];
  }

  deleteLocalUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void updateStartedAtInCloudFireStore() {
    userCollection.doc(user.value.uid).update({
      'startedAt': Timestamp.now(),
    });
  }
}
