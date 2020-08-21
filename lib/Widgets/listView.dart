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

      return null;
  }
}