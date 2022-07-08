import 'package:easetour_flutter/responsive/mobile_screen_layout.dart';
import 'package:easetour_flutter/responsive/responsive_layout_screen.dart';
import 'package:easetour_flutter/responsive/web_screen_layout.dart';
import 'package:easetour_flutter/screens/login_screen.dart';
import 'package:easetour_flutter/screens/navpages.dart/main_screen.dart';
import 'package:easetour_flutter/screens/signup_screen.dart';
import 'package:easetour_flutter/screens/welcome_screen.dart';
import 'package:easetour_flutter/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCWX6V3Ib3BHjUl0niHdjKi3zRlbCXrth8',
      appId: '1:232373156927:web:c9c1dd04d41d5ad75b0c8a',
      messagingSenderId: '232373156927',
      projectId: 'easetour-1d6d9',
      storageBucket: 'easetour-1d6d9.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easetour',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      //home: const ResponsiveLayout(
      // webScreenLayout: WebScreenLayout(),
      //mobileScreenLayout: MobileScreenLayout(),

      home: MainScreen(),
      //),
    );
  }
}
