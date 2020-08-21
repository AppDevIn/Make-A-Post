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
  
  //Defualt construtor
  CustomDialog();

  @override
  State<StatefulWidget> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  
  
  //TODO: This is the TextEditingController
  
  //TODO method to _pickImage
 

  _CustomDialogState();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(child: Text("Hello this is the dialog"),),
    );
  }
}


//TODO: Body Content