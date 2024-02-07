import 'package:flutter/material.dart';
import 'package:mixify/presentation/splash_screen.dart';
import 'package:mixify/presentation/widget/colors.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mixify',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        //useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

