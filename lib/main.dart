import 'package:akashistagram/providers/user_provider.dart';
import 'package:akashistagram/responsive/mobile_screen_layout.dart';
import 'package:akashistagram/responsive/responsive_layout_screen.dart';
import 'package:akashistagram/responsive/web_screen_layout.dart';
import 'package:akashistagram/screens/signup_screen.dart';
import 'package:akashistagram/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:akashistagram/utils/colors.dart';
import 'package:akashistagram/responsive/mobile_screen_layout.dart';
import 'package:akashistagram/responsive/web_screen_layout.dart';
import 'package:akashistagram/responsive/responsive_layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:akashistagram/screens/login_screen.dart';
import 'package:akashistagram/screens/signup_screen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        title: 'Akashistagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        //home: ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(),webScreenLayout: WebScreenLayout(),)
        home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.active) {
              if(snapshot.hasData){
                return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                );
              } else if(snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          }
        ),
      ),
    );
  }
}

