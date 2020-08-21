import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'listView.dart';
import 'package:InstaPostOnly/class/post.dart';
import '../postBloc.dart';

class CustomDialog extends StatefulWidget {
  final PostBloc postBloc;
  //Defualt construtor
  CustomDialog({this.postBloc});

  @override
  State<StatefulWidget> createState() => _CustomDialogState(postBloc);
}

class _CustomDialogState extends State<CustomDialog> {
  File _file;
  final PostBloc postBloc;
  final picker = new ImagePicker();

  final TextEditingController _name = new TextEditingController();
  final TextEditingController _caption = new TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final selected = await picker.getImage(source: source);

    setState(() => _file = File(selected.path));
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(sourcePath: _file.path);

    setState(() => _file = cropped ?? _file);
  }

  _CustomDialogState(this.postBloc);

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

  dialogContent() {
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
                offset: Offset(0.0, 10.0)),
          ]),
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
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text(
                  "Upload image",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: RaisedButton(
                  onPressed: () async {
                    final bytes = await _file.readAsBytes();
                    // String _base64 = base64Encode(response.bodyBytes);
                    // Uint8List bytes = base64Decode(_base64);
                    postBloc.postAdd.add(Post(name: _name.text, caption: _caption.text, imageCode: bytes));
                    print("clicked");
                  },
                  child: Text(
                    "Upload",
                    style: TextStyle(color: Colors.white),
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
