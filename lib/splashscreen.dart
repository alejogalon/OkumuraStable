import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:okumurastableforowner/loginpage.dart';
import 'package:okumurastableforowner/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body:
      AnimatedSplashScreen(
          duration: 3000,
          splash:
          Text('OKUMURA',
            style: TextStyle(color: AppColors.maincolor,
                fontSize: 50),),
          nextScreen: LoginPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: AppColors.kLightGrey));

      /*Center(
        child: Column(
          children: [
            Text('OKUMURA'),
            SpinKitDoubleBounce(
              color: Colors.white,
              size: 80,
            ),
          ],
        ),
      ),*/
  }
}
