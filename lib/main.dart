import 'package:flow_chat/navigations/main_top_tab.dart';
import 'package:flow_chat/pages/chat.dart';
import 'package:flow_chat/pages/login.dart';
import 'package:flow_chat/pages/register.dart';
import 'package:flow_chat/pages/settings.dart';
import 'package:flow_chat/utils/asset.dart' as asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlowChat());
}

class FlowChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: appName,
            debugShowCheckedModeBanner: false,
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
            home: Register(),
            getPages: [
              GetPage(name: MainTopTab.name, page: () => MainTopTab()),
              GetPage(name: Login.name, page: () => Login()),
              GetPage(name: Register.name, page: () => Register()),
              GetPage(name: Settings.name, page: () => Settings()),
            ],
          );
        }

        return Container();
      },
    );
  }
}
