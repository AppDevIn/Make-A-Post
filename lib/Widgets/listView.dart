import 'package:flutter/material.dart';
import '../class/post.dart';


class PostView extends StatefulWidget{

  Post posts;
  _PostViewState main = null;
  // construtor  
  PostView(Post posts){
    this.posts = posts;
    main  = new _PostViewState(posts);
  }
   

  

  @override
  State<StatefulWidget> createState() => main;

}

class _PostViewState extends State<PostView>{

  Post post;
  _PostViewState(Post posts){
    this.post = posts;
  }

 
  @override
  Widget build(BuildContext context) {

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
                  Text(post.name)
                ],
              ),
            ),   
            Image.memory(post.imageCode),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            )
          ],  
         ),
       ); 

  }
}