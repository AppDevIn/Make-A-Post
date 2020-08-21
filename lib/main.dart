import 'dart:html';

import 'package:flutter/material.dart';

import 'postScreen.dart';

void main() => runApp( MaterialApp(
  home:OnBoarding()));

class OnBoarding extends StatefulWidget {
  //Defualt construtor
  OnBoarding();

  @override
  State<StatefulWidget> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: null,
        body: Center(child: Text("Hello Overflowers"),)
      ),
    );
  }
}






