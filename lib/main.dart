import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
import 'home.dart';
import 'test.dart';
import 'learn.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the list of available cameras
  final cameras = await availableCameras();

  // Run App
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras; // List of available cameras

  MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/test': (context) => Test(),
        '/learn': (context) => Learn(cameras: cameras), // Pass cameras to Learn
      },
      initialRoute: '/',
    );
  }
}