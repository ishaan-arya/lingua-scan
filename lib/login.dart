import 'package:flutter/material.dart';
import 'constants.dart';
import 'home.dart';

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
                      try {
                        Navigator.pushNamed(context, '/home');
                      } catch (e) {
                        print("Navigation error: $e");
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff514D4D),
                        borderRadius: BorderRadius.circular(10),
                      ),
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
      ),
    );
  }
}
