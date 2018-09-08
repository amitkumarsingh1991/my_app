
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarked extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    appBar: AppBar(
      title: Text("BookMarked"),
      backgroundColor: Colors.blue,
    );
    return Container(
      child: new Center (
          child: Text('Bookmarked'),
      ),

    );
  }
  }