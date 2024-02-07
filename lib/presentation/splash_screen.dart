import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mixify/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){

    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const Home()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/mixify.png"),
              width: 300,
            ),
            Center(
              child: Text(
                  "Mixify",
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20)
              ),
            ),
            SizedBox(height: 5,),
            Text(
                "Music, Movie & Magic",
                style: GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white60)
            ),
            SizedBox(height: 10,),
            SpinKitWave(
              color: Colors.white,
              size: 20.0,
              ),
          ],
        ),
      ),
    );
  }
}
