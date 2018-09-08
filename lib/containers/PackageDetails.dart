import 'package:flutter/material.dart';
import 'package:my_app/widgets/BookMarked.dart';
import 'package:my_app/widgets/HomeNewsList.dart';
import 'package:my_app/widgets/NewsSort.dart';


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
   int _currentIndex = 0;
   final List<Widget> _children = [
     HomeNewsList(),
     BookMarked(),
     NewsSort()
   ];
   void onTabTapped(int index) {
     print('checiign');
     setState(() {
       _currentIndex = index;
     });
   }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   // this.fetchPost('sport');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // footer button
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.blue,
              primaryColor: Colors.red,
            ), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.menu),
                title: new Text("Home"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.book),
                title: new Text("save"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.sort),
                title: new Text("sort"),
              ),
            ],
          ),
        ),
       body: new Stack(
         children: <Widget>[
           _children[_currentIndex],
         ],
       )

    );
  }

}