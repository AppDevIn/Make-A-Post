import 'package:flutter/material.dart';
import 'main.dart';
import 'Widgets/listView.dart';
import 'Widgets/dialog.dart';
import 'class/post.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

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
        body: StreamBuilder(
              stream: Firestore.instance.collection("posts").snapshots(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                     return ListView.separated(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, pos) => PostView(snapshot.data.documents[pos])
                      ,
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),);
                      }
                      );
                } else {
                  return CircularProgressIndicator();
                }
              },
              )

          ),
          

        );
  }
}

Future<List<Post>> generatePost () async{

 http.Response response = await http.get(
        'https://i.ytimg.com/vi/RNRN7tW1Vgg/maxresdefault.jpg',
      );

  String _base64 = base64Encode(response.bodyBytes);
  Uint8List bytes = base64Decode(_base64);

  List<Post> posts = new List<Post>();
  for (int i = 0; i < 5; i++){
    posts.add(new Post(name: "Inori Yuzuriha", imageCode: bytes));
  }

  return posts;
}
