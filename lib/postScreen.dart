import 'package:flutter/material.dart';
import 'main.dart';
import 'Widgets/listView.dart';
import 'Widgets/dialog.dart';
import 'class/post.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'postBloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        debugShowCheckedModeBanner: false,
        home: Main());
  }
}

class Main extends StatelessWidget {
  Main();

  

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Overflow"),
      ),
      body: Center(
          child: Text('Hello World'),
      )
    ));
  }
}

//Fake Data
generatePost(StreamController<List<Post>> controller, List<Post> post) async {
  http.Response response = await http.get(
    'https://i.ytimg.com/vi/c7oV1T2j5mc/maxresdefault.jpg',
  );

  String _base64 = base64Encode(response.bodyBytes);
  Uint8List bytes = base64Decode(_base64);

  List<Post> posts = new List<Post>();
  for (int i = 0; i < 1; i++) {
    posts.add(new Post(name: "inori yuzuriha", imageCode: bytes));
  }

  controller.add(posts);
  post = posts;
}