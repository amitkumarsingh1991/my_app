import 'package:flutter/material.dart';
import 'package:my_app/widgets/DemoWidget.dart';

class Home extends StatelessWidget {
@override
Widget build(BuildContext context){

  return  MaterialApp(
       title: 'Express Noon',
       theme:  ThemeData(
       primarySwatch: Colors.indigo,
       ),
       home: Scaffold(
         appBar: AppBar( title: Text('Welcome to news menia'),),
         body:  DemoWidgets()
       ),

  );
}
}


