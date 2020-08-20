import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {


  const CustomAppBar();


  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Center(child: Image(image: AssetImage('graphics/background.png'))),
          
        );
  }
}

