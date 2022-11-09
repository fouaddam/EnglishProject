
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RFTextFiled extends StatelessWidget{

  final String title;
  TextEditingController textEditingController=new TextEditingController();
  final bool password;

  RFTextFiled({super.key, required this.title,  this.password=false});

  String getText(){
    return textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  TextFormField(
      controller: textEditingController,
      obscureText:password,
      cursorColor: Colors.black,
      maxLength: 20,
      decoration: InputDecoration(
        icon: Icon(Icons.favorite),
        labelText: title,
        labelStyle: TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: title,
        suffixIcon: Icon(
          Icons.check_circle,
        ),

      ),
    );
  }




}