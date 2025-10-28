import 'package:flutter/material.dart';
import 'package:group_study_app/splash_screen.dart';
import 'package:group_study_app/services/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize auth service if needed (in-memory here)
  AuthService.instance.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Study App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
