import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'listView.dart';
import 'package:InstaPostOnly/class/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CustomDialog extends StatefulWidget{

  PostView update;
  //Defualt construtor
  CustomDialog({this.update});

  @override
  State<StatefulWidget> createState() => _CustomDialogState(update);

}

class _CustomDialogState extends State<CustomDialog>{

  File _file;
  PostView update;
  final picker = new ImagePicker();

  final TextEditingController _name = new TextEditingController();
  final TextEditingController _caption = new TextEditingController();

  Future<void> _pickImage(ImageSource source) async{
    final selected = await picker.getImage(source: source);

    setState(() => _file = File(selected.path));
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(sourcePath: _file.path);

    setState(() => _file = cropped ?? _file);
  }

  _CustomDialogState(this.update);

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(),
    );

  }

CollectionReference posts = Firestore.instance.collection('posts');
     Future<void> addUser(String link, String caption, String name) {
      // Call the user's CollectionReference to add a new user
      return posts
          .add({
            'name': name, // John Doe
            'caption': caption,// Stokes and Sons// 42
            'imageCode': link
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

  dialogContent(){
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0)
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         Text("Make a post"),
          SizedBox(height: 16),
          TextField(
            controller: _name,
            decoration: InputDecoration.collapsed(hintText: "Name"),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _caption,
            decoration: InputDecoration.collapsed(hintText: "Caption"),
          ),
          SizedBox(height: 16),
          SizedBox(height: 16),
          Row(
           children: <Widget>[
             RaisedButton(
               onPressed: () => _pickImage(ImageSource.gallery),
               child: Text("Upload image",
               style: TextStyle(
                 color: Colors.white
               ),
               ), 
              ),
              SizedBox(width: 16),
                     RaisedButton(
               onPressed: () async {
                final bytes = await _file.readAsBytes();
                print("clicked");
                // String _base64 = base64Encode(response.bodyBytes);
                // Uint8List bytes = base64Decode(_base64);
                String b = base64Encode(bytes);
                
                
                StorageUploadTask _task;
                String filePath = 'image/${DateTime.now()}.png';
                final StorageReference _storage = FirebaseStorage.instance.ref().child(filePath);
                _task = _storage.putFile(_file);
                StorageTaskSnapshot _snap = await _task.onComplete;
                
                _snap.ref.getDownloadURL().then((value) => addUser(value, _caption.text, _name.text));

                
                
                //  update.addPost(new Post(name: "Test", imageCode: bytes ));
               },
               child: Text("Upload",
               style: TextStyle(
                 color: Colors.white
               ),
               ), 
              ),
           ], 
          )

        ],
      ),
    );
  }

}
