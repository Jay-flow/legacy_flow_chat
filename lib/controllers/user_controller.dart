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
    return prefs.getString('phoneNumber');
  }

  Future<void> setLocalUserData() async {
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

  Future<Map<String, dynamic>> _getCloudUserData(phoneNumber) async {
    DocumentSnapshot user = await userCollection.doc(phoneNumber).get();
    return user.data();
  }

  _setUserListener(String phoneNumber) async {
    DocumentSnapshot user = await userCollection.doc(phoneNumber).get();
    user.reference.snapshots().listen((event) {
      if (event.data() != null) {
        this._setUser(event.data());
      }
    });
  }

  _setUser(userData) {
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

  Future<bool> isExistentUser(phoneNumber) async {
    Map<String, dynamic> userData = await this._getCloudUserData(phoneNumber);
    if (userData != null) {
      this._setUser(userData);
      this._setUserListener(phoneNumber);
      this._updateStartedAtInCloudFireStore();
      return true;
    }
    this._deleteLocalUserData();
    return false;
  }

  _deleteLocalUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _updateStartedAtInCloudFireStore() {
    userCollection.doc(user.value.phoneNumber).update({
      'startedAt': Timestamp.now(),
    });
  }
}
