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
      home: Main()
    );
  }
}


class Main extends StatelessWidget{


  Main();

  PostView postView = null;



  @override
  Widget build(BuildContext context) {

    final _postBloc = PostBloc();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Overflow"),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.add), tooltip: "Add post", onPressed:() {
              showDialog(context: context, builder: (BuildContext context) => CustomDialog(update: postView,));
            })
          ],
        ),
        body: Container(
          child: Center(
            child: StreamBuilder<List<Post>>(
              stream: _postBloc.postListStream,
              builder: (context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.hasData) {
                  postView = PostView(snapshot.data);
                  return postView;
                } else {
                  return CircularProgressIndicator();
                }
              },
              )

          ),
          

        ),
      ));
  }
}

