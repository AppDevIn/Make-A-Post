import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget{

  
  final TextEditingController _controller = new TextEditingController();
  CustomDialog();


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
               onPressed: null,
               child: Text("Upload image",
               style: TextStyle(
                 color: Colors.white
               ),
               ), 
              ),
              SizedBox(width: 10,),
              RaisedButton(
               onPressed: null,
               child: Text("Take a photo",
               style: TextStyle(
                 color: Colors.white
               ),
               ), 
              )
           ], 
          )

        ],
      ),
    );
  }
}