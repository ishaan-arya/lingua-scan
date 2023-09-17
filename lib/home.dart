import 'package:flutter/material.dart';
import 'constants.dart';
import 'learn.dart';
import 'test.dart';

class HomePage extends StatelessWidget {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 80),
                  child: Text(
                    "Hola, Lorem",
                    style: kHeadingTextStyle,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff514D4D),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 50),
                          child: Text(
                            "🇪🇸",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff514D4D),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 50),
                          child: Text(
                            "🇯🇵",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ],
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
