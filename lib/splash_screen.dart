import 'dart:async';
import 'package:flutter/material.dart';
import 'package:group_study_app/login_screen.dart';
import 'package:group_study_app/home_screen.dart';
import 'package:group_study_app/services/auth_service.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      if (AuthService.instance.isSignedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF4F1EB),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.04,
              ),
              child: Column(
                children: [
                  // ✅ TOP SECTION (dynamic top padding)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Image.asset(
                          'images/groupicon.png',
                          height: constraints.maxHeight * 0.15,
                          width: constraints.maxHeight * 0.15,
                          errorBuilder: (c, e, s) =>
                              const Icon(Icons.groups, size: 100),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Group Study App',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 23, 63),
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ✅ FLEXIBLE SPACE (auto scales on web)
                  const Spacer(),

                  // ✅ BOTTOM SECTION (always pinned bottom)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: constraints.maxHeight * 0.05,
                    ),
                    child: const Text(
                      'Collaborate, Learn and Grow together 🌱',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 23, 63),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
