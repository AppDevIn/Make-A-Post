import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'listView.dart';
import 'package:InstaPostOnly/class/post.dart';


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

  final TextEditingController _controller = new TextEditingController();

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
            controller: _controller ,
          ),
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
                     RaisedButton(
               onPressed: () async {
                final bytes = await _file.readAsBytes();
                print("clicked");
                // String _base64 = base64Encode(response.bodyBytes);
                // Uint8List bytes = base64Decode(_base64);
                 update.addPost(new Post(name: "Test", imageCode: bytes ));
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
