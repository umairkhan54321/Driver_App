import 'dart:async';

import 'package:driver_app/Screens/Authentication/signup_screen.dart';
import 'package:driver_app/Screens/Main_Screens/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(Duration(seconds: 3), ()async{
      Navigator.push(context, MaterialPageRoute(builder:
       (c)=>const SignupScreen()));
    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo1.png'),
              const SizedBox(height: 20,),
             const Text(
                'Uber & inDrive clone App',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}