import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'home.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // LoginScreen({super.key});

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
                    onTap: () 
                    async {
                      Navigator.pushNamed(context, '/home');
                      // signInWithGoogle()
                          // .then((UserCredential user) {
                          //  debugPrint("Hello world");
                          // }).catchError((e) => print(e));
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

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final googleAuthCredential =
          GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
    return await _auth.signInWithCredential(googleAuthCredential);
    }
}
