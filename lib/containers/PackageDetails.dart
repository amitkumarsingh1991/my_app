import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/widgets/Workspace.dart';
import 'package:my_app/containers/NewsMoreDetails.dart';

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
   Future<List> fetchPost(String category) async {
     final String url = 'https://newsapi.org/v2/top-headlines?country=in&category=${category}&apiKey=3049e63f96e143f3be070d8f031f68d6';
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
    this.fetchPost('sport');
  }

  @override
  Widget build(BuildContext context) {
    String url = 'https://c.ndtvimg.com/2018-09/0pvfjoro_jasprit-bumrah-reuters_625x300_08_September_18.jpg';
    return Scaffold(
      appBar: AppBar(
        title: Text("Package Details"),
      ),
      body: Container(
          child: this.data != null ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              child: Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsMoreDetails()),
                      );
                    },child: Column(
                    children: <Widget>[
                      new Image.network(data[index]['urlToImage'] == null ? url : data[index]['urlToImage'],fit: BoxFit.fill),
                      new Text(data[index]['description'] == null ? 'not found' : data[index]['description']),
                    ],
                  ),
                  )

                ],
              ),

            );
          },

        ) :  new WorkSpace(),// DATA LOADER

    )

    );
  }

}