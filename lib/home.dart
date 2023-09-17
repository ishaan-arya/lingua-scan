import 'package:flutter/material.dart';
import 'constants.dart';
import 'learn.dart';
import 'test.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class HomePage extends StatelessWidget {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 80),
                  child: Text(
                    "Hola, Lorem",
                    style: kHeadingTextStyle,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      GlassContainer(
                        height: 150,
                        width: 150,
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
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 45),
                          child: Text(
                            "🇪🇸",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GlassContainer(
                        height: 150,
                        width: 150,
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
                        child: Padding(
                          padding: EdgeInsets.only(top: 30, left: 45),
                          child: Text(
                            "🇯🇵",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GlassContainer(
                      height: 100,

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
                          "Learn",
                          style: kHeadingTextStyle.copyWith(
                            fontSize: 25,
                            color: kPrimaryGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/learn');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: GlassContainer(
                      height: 100,

                      blur: 8,
                      color: Colors.white.withOpacity(1),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.5),
                          kPrimaryPurple.withOpacity(0.6),
                        ],
                      ),
                      //--code to remove border
                      border: Border.fromBorderSide(BorderSide.none),
                      shadowStrength: 8,
                      borderRadius: BorderRadius.circular(16),
                      shadowColor: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          "Test",
                          style: kHeadingTextStyle.copyWith(
                              fontSize: 25, color: kPrimaryGrey),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/test');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
