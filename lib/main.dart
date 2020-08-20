import 'package:flutter/material.dart';

import 'onBoarding.dart';

void main() => runApp( MaterialApp(
  ,
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Center(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Image(
                        image: AssetImage('images/overflow.png'),
                      ),
                      Text(
                        "Instagram but for overflow",
                        style: TextStyle(color: Colors.black),
                      )
                    ]),
                  ]),
            )),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                          color: Colors.blue,
                          onPressed: () => Navigator.push(ctx, 
                              MaterialPageRoute(builder: (ctx) => new MyApp())),
                          child: Text("Get Started"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






