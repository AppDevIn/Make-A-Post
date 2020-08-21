import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'class/post.dart';

class PostBloc {

  //This is List
  
  //Controller

  //getters
  

  //Constructor
  

  //Dispose 
  
}

//Fake data
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
