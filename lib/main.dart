import 'package:flutter/material.dart';
import 'Widgets/listView.dart';
import 'class/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Overflow"),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.add), tooltip: "Add post", onPressed: null)
          ],
        ),
        body: Container(
          child: Center(
            child: PostView(generatePost())
          ),

        ),
      ),
    );
  }
}

List<Post> generatePost(){
  List<Post> posts = new List<Post>();
  for (int i = 0; i < 5; i++){
    posts.add(new Post(name: i.toString()));
  }

  return posts;
}
