import 'package:flutter/material.dart';
import 'constants.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';


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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                kPrimaryBlue,
                kPrimaryPurple,
              ], // Change colors as needed
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("[Insert App Name]", style: kHeadingTextStyle),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "email",
                      filled: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "password",
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: GestureDetector(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff514D4D),
                          borderRadius: BorderRadius.circular(10),
                          
                          ]),
                      child: Center(
                        child: Text("Log In", style: kButtonTextStyle),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff62DCFA),
              Color(0xff43CAE2),
              Color(0xff1894B3),
              Color(0xff11171C),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                
                child: Text("Click Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment(0.8, 1),

//             colors: <Color>[
//               Color(0xff0ba8ff),
//               Color(0xffc687ff),
//             ], // Gradient from https://learnui.design/tools/gradient-generator.html
//             tileMode: TileMode.mirror,
//           ),
//         ),