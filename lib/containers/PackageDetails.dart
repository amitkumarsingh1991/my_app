import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/widgets/Workspace.dart';
import 'package:my_app/conversion/NewsModal.dart';

class PackageDetails extends StatefulWidget{
  @override
  PackageDetail createState() =>  new PackageDetail();

}

/* future pupose*/
//List<NewsList> createUserList(List data) {
//  List<NewsList> list = new List();
//  for (int i = 0; i < data.length; i++) {
//    String title = data[i]["title"];
//   // int id = data[i]["id"];
//    NewsList movie = new NewsList(title: title);
//    list.add(movie);
//  }
//  return list;
//}

 class PackageDetail extends State<PackageDetails> {
   List data;
   Future<List> fetchPost() async {
     final String url = 'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=3049e63f96e143f3be070d8f031f68d6';
     final response = await http.get(url);
     if (response.statusCode == 200) {
       List list = json.decode(response.body)['articles'];
       this.setState(() {
         data = list;
       });
       return list;
     } else {
       // If that call was not successful, throw an error.
       throw Exception('Failed to load post');
     }
   }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchPost();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Package Details"),
      ),
      body: Container(
        child: this.data != null ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              child: Text('${index} : ${data[index]['title']}'),
            );
          },

        ) :  new WorkSpace(),// DATA LOADER

    )
    );
  }

}