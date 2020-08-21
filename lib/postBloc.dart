import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'class/post.dart';
class PostBloc{



  final _postListSteamController = StreamController<List<Post>>();



  //getters
  Stream<List<Post>> get postListStream => _postListSteamController.stream;
  StreamSink<List<Post>> get postListSink => _postListSteamController.sink;

  PostBloc(){
    _postListSteamController.add([]);
    generatePost(_postListSteamController);
  }


  void dispose(){
    _postListSteamController.close();
  }

}


Future<List<Post>> generatePost (StreamController<List<Post>> controller) async{

http.Response response = await http.get(
        'https://i.ytimg.com/vi/RNRN7tW1Vgg/maxresdefault.jpg',
      );

  String _base64 = base64Encode(response.bodyBytes);
  Uint8List bytes = base64Decode(_base64);

  List<Post> posts = new List<Post>();
  for (int i = 0; i < 5; i++){
    posts.add(new Post(name: "inori yuzuriha", imageCode: bytes));
  }

  controller.add(posts);
  return posts;
}