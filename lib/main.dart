import 'package:akashistagram/responsive/mobile_screen_layout.dart';
import 'package:akashistagram/responsive/responsive_layout_screen.dart';
import 'package:akashistagram/responsive/web_screen_layout.dart';
import 'package:akashistagram/screens/signup_screen.dart';
import 'package:akashistagram/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:akashistagram/utils/colors.dart';
import 'package:akashistagram/responsive/mobile_screen_layout.dart';
import 'package:akashistagram/responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:akashistagram/screens/login_screen.dart';
import 'package:akashistagram/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //home: ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),)
      home: SignupScreen(),
    );
  }
}

