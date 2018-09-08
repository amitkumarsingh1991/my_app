import 'package:flutter/material.dart';
import 'package:my_app/containers/PackageDetails.dart';

class DemoWidgets extends StatelessWidget {

@override
Widget build(BuildContext context){
  return new Container(
     alignment: Alignment.center,
     color: Colors.lightGreen,
     child: new RaisedButton(onPressed: () {
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => PackageDetails()),
       );
     },
      child: new Text("NextPage"),

     ));
}
}
