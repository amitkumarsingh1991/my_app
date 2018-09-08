
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/widgets/Workspace.dart';
import 'package:my_app/styles/styles.dart';

class HomeNewsList extends StatefulWidget{
  @override
  HomeNews createState() => HomeNews();
}

class HomeNews extends State<HomeNewsList>{
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
    // TODO: implement build
    String url = 'https://c.ndtvimg.com/2018-09/0pvfjoro_jasprit-bumrah-reuters_625x300_08_September_18.jpg';
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
      ),
    body: Container(
      color: Colors.black26,
          child: this.data != null ? ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                      new Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            new Container(
                              width: 270.0,
                              child: Column(
                                children: <Widget>[
                                  new Text(data[index]['title'] == null ? 'not found' : data[index]['title'], style: textStyles['title']),
                                  new Text(data[index]['description'] == null ? 'not found' : data[index]['description'], style: textStyles['disc']),
                                ],
                              ),
                            ),
                            new Container(
                              width: 100.0,
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                children: <Widget>[
                                  new Image.network(data[index]['urlToImage'] == null ? url : data[index]['urlToImage'], fit: BoxFit.fill,),

                                ],
                              ),
                            )
                          ],
                        ),

                      ),
                  new Container(
                    margin: EdgeInsets.all(8.0),
                    foregroundDecoration: BoxDecoration(border: Border()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(Icons.share),
                          tooltip: 'Share news',
                          onPressed: () { setState(() {  }); },
                        ),
                        new IconButton(
                          icon: new Icon(Icons.bookmark),
                          tooltip: ' save for later ',
                          onPressed: () { setState(() {  }); },
                        )
                      ],
                    ),
                  )

                ],
                  ),
            );
          }
        ) :  new WorkSpace(),// DATA LOADER  End

    ),
  );
}
}