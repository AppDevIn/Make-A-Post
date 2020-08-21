import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'class/post.dart';

class PostBloc {
  List<Post> _posts = new List<Post>();

  final _postListSteamController = StreamController<List<Post>>();
  final _postListAddComtroller = StreamController<Post>();

  //getters
  Stream<List<Post>> get postListStream => _postListSteamController.stream;
  StreamSink<List<Post>> get postListSink => _postListSteamController.sink;

  StreamSink<Post> get postAdd => _postListAddComtroller.sink;

  PostBloc() {
    _postListSteamController.add([]);
    
    
    generatePost(_postListSteamController, _posts);

    _postListAddComtroller.stream.listen((post) {
      _posts.add(post);
      postListSink.add(_posts);
      print(_posts);
    });
  }

  void dispose() {
    _postListSteamController.close();
    _postListAddComtroller.close();
  }
}

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
