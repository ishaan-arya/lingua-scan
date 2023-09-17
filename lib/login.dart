import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                kPrimaryPurple,
                kPrimaryBlue,
              ], // Change colors as needed
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LingoSnap", style: kHeadingTextStyle),
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
                      try {
                        Navigator.pushNamed(context, '/home');
                      } catch (e) {
                        print("Navigation error: $e");
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: GlassContainer(
                        height: 65,

                        blur: 8,
                        color: Colors.white.withOpacity(1),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.blue.withOpacity(0.6),
                          ],
                        ),
                        //--code to remove border
                        border: Border.fromBorderSide(BorderSide.none),
                        shadowStrength: 8,
                        borderRadius: BorderRadius.circular(16),
                        shadowColor: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: kHeadingTextStyle.copyWith(
                                fontSize: 20, color: kPrimaryGrey),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
