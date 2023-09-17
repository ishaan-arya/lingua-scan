import 'package:flutter/material.dart';

const Color kPrimaryBlue = Color(0xff0ba8ff);
const Color kPrimaryPurple = Color(0xffc687ff);

const kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);

const kButtonTextStyle =
    TextStyle(fontSize: 18, fontFamily: "Poppins", color: Colors.white);
const kHeadingTextStyle = TextStyle(
  fontSize: 32,
  fontFamily: "Poppins",
  color: Colors.white, // Text color
);
