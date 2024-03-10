import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product/firebase_options.dart';
import 'package:product/picture.dart';
import 'package:product/screens/my_blog.dart';
import 'package:product/screens/user_data_screen.dart';
import 'package:product/screens/blogs.dart';
import 'package:product/screens/cea.dart';
import 'package:product/screens/city.dart';
import 'package:product/screens/culture.dart';
import 'package:product/screens/signup.dart';
import 'package:product/screens/mountant.dart';
import 'package:product/screens/nature.dart';
import 'package:product/screens/signin.dart';

import 'package:product/screens/tiger.dart';
import 'package:product/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: WelcomeScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => WelcomeScreen(),
          '/signup': (context) => SignUpScreen(),
          '/signin': (context) => SignIn(),
          '/blogs': (context) => Blogs(),
          '/picture': (context) => PictureScreen(),
          '/nature': (context) => NatureScreen(),
          '/culture': (context) => CutlureScreen(),
          '/mountant': (context) => MountantScreen(),
          '/city': (context) => CityScreen(),
          '/cea': (context) => CeaScren(),
          '/tiger': (context) => TigerScreen(),
          '/my_blog': (context) => UserInputScreen(),
        });
  }
}
