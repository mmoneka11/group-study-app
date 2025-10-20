import 'dart:async';
import 'package:flutter/material.dart';
import 'package:group_study_app/login_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=>LoginScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F1EB),
        body:
            
        Padding(padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/groupicon.png',
                height: 120,
                width: 120,

                ),
                SizedBox(
                  height: 20,
                ),
                Text('Group Study App',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,
                  ),
                ),
                SizedBox(
                  height: 220,
                ),
                Image.asset('assets/🌱.png',
                  height: 100,
                  width: 100,
                ),

                Text(
                  'Collaborate, Learn and Grow together',


                )

              ],
            ),
          ),
        )
    );
  }
}
