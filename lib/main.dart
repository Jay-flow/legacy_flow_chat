import 'package:flow_chat/navigations/main_top_tab.dart';
import 'package:flow_chat/pages/chat.dart';
import 'package:flow_chat/pages/login.dart';
import 'package:flow_chat/pages/register.dart';
import 'package:flow_chat/pages/settings.dart';
import 'package:flow_chat/utils/asset.dart' as Asset;
import 'package:flow_chat/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
          return MaterialApp(
            title: kAppName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Asset.Colors.hotPink,
              accentColor: Asset.Colors.pastelGreen,
              primaryColorDark: Asset.Colors.blueBlack,
              primaryColorLight: Asset.Colors.skyBlue,
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
            initialRoute: Register.id,
            routes: {
              Chat.id: (context) => Chat(),
              Login.id: (context) => Login(),
              Register.id: (context) => Register(),
              MainTopTab.id: (context) => MainTopTab(),
              Settings.id: (context) => Settings()
            },
          );
        }

        return Container();
      },
    );
  }
}
