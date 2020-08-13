import 'package:flutter/material.dart';
import '../class/post.dart';


class PostView extends StatefulWidget{

  List<Post> posts;

  // construtor  
  PostView(List<Post> posts){
    this.posts = posts;
  }
  

  @override
  State<StatefulWidget> createState() => _PostViewState(posts);

}

class _PostViewState extends State<PostView>{

  List<Post> posts;
  _PostViewState(List<Post> posts){
    this.posts = posts;
  }

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int pos){
       return Container(
         color: Colors.white,
         child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width:10
                  ),
                  Text(posts[pos].name)
                ],
              ),
            ),   
            Image.memory(posts[pos].imageCode)
          ],  
         ),
       ); 
    },
    separatorBuilder: (BuildContext context, int index) {
      return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),);
    }
    );

  }
}