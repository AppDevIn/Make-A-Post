import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../class/post.dart';



class PostView extends StatefulWidget{

  DocumentSnapshot posts;
  _PostViewState main = null;
  // construtor  
  PostView(DocumentSnapshot posts){
    this.posts = posts;
    main  = new _PostViewState(posts);
  }
   
   
  // addPost(Post post){
  //   main.addPost(post);
  // }
  

  @override
  State<StatefulWidget> createState() => main;

}

class _PostViewState extends State<PostView>{

  DocumentSnapshot posts;
  _PostViewState(DocumentSnapshot posts){
    this.posts = posts;
    
  }
  




  //  addPost(Post post){
  //   setState(() {

  //     posts.add(post);
  //   });
  // }

  @override
  Widget build(BuildContext contex) {
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
                  Text(posts["name"])
                ],
              ),
            ),   
            Image.network(posts["imageCode"]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(posts["caption"],
            )
            )
          ],  
         ),
       ); 

  }
}

