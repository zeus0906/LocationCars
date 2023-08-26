
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CarsDialog{
  User? user;
  CarsDialog({this.user});

  void showCarsDialog(BuildContext context, ImageSource source) async{
    XFile? _pickedFile = await ImagePicker().pickImage(source: source);
    File _file = File(_pickedFile!.path);
    showDialog(context: context, builder: (BuildContext context){
      return SimpleDialog(
        contentPadding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.grey,
              image: DecorationImage(
                image: FileImage(_file),
                fit: BoxFit.cover,
              )
            ),
          )
        ],
      );
    });
  }

}