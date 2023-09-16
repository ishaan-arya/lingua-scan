import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run App
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),

          colors: <Color>[
            Color(0xff62DCFA),
            Color(0xff43CAE2),
            Color(0xff1894B3),
            Color(0xff11171C),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(children: [
        Text(
          "Hello",
          style: TextStyle(
              color: Colors.white, // Set text color to white
              fontWeight: FontWeight.bold,
              fontSize: 32 // Set text to bold
              ),
        ),
      ]),
    ));
  }
}
