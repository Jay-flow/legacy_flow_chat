import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_chat/components/loading_container.dart';
import 'package:flow_chat/controllers/user_controller.dart';
import 'package:flow_chat/navigations/main_top_tab.dart';
import 'package:flow_chat/pages/login.dart';
import 'package:flow_chat/pages/register.dart';
import 'package:flow_chat/pages/settings.dart';
import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlowChat());
}

class FlowChat extends StatefulWidget {
  @override
  _FlowChatState createState() => _FlowChatState();
}

class _FlowChatState extends State<FlowChat> {
  final bool _isDebugShowCheckedModeBanner = false;
  bool _isLoading = true;
  bool _isExistentUser = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await Firebase.initializeApp();
    await _findUser();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _findUser() async {
    UserController userController = Get.put(UserController());
    final String uid = await userController.getLocalUserData();
    User firebaseUser = FirebaseAuth.instance.currentUser;
    if (uid != null && firebaseUser != null) {
      Map<String, dynamic> cloudUser = await userController.getCloudUserData(uid);
      if(cloudUser != null) {
        userController.setUser(cloudUser);
        userController.setUserListener(uid);
        userController.updateStartedAtInCloudFireStore();
        _isExistentUser = true;
      } else {
        userController.deleteLocalUserData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: _isDebugShowCheckedModeBanner,
      theme: ThemeData(
        primaryColor: asset.Colors.hotPink,
        accentColor: asset.Colors.pastelGreen,
        primaryColorDark: asset.Colors.blueBlack,
        primaryColorLight: asset.Colors.skyBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: LoadingContainer(
        isLoading: _isLoading,
        child: _isLoading
            ? SizedBox.shrink()
            : _isExistentUser
                ? MainTopTab()
                : Register(),
      ),
      getPages: [
        GetPage(name: MainTopTab.name, page: () => MainTopTab()),
        GetPage(name: Login.name, page: () => Login()),
        GetPage(name: Register.name, page: () => Register()),
        GetPage(name: Settings.name, page: () => Settings()),
      ],
    );
  }
}
