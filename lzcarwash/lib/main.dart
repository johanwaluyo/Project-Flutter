import 'package:flutter/material.dart';
import 'package:lzcarwash/pages/grid_listview.dart';
import 'package:lzcarwash/pages/tiles.dart';
import 'package:lzcarwash/pages/form.dart';
import 'package:lzcarwash/pages/loading.dart';
import 'package:lzcarwash/pages/notification.dart';

void main() => runApp(MaterialApp(
  home:MyApp(), 
  theme: appTheme,
));

ThemeData appTheme = ThemeData(
  primaryColor: Colors.lightGreen,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0 ;
  List<Widget> pages = [
    GridListView(),
    Tiles(),
    Forms(),
    Loader(),
  ];

 
     var title = '';//title is "mutable property"

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      drawer: new Drawer(
            child: new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image.asset('assets/images/dev.png',height: 50.0,width: 50.0,),
                        new Text("Profile Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        new Text("Title",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.lightGreen,
                  ),
                ),
                new ListTile(
                  leading: new Icon(Icons.notifications),
                  title: new Text("Notifications"),
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => Notifications()
                      )
                    );
                  },
                ),
              ],
            ),
          ),
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        title: Text('Flutter Component',style: TextStyle(color: Colors.white),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: (int idx){
          setState(() {
            index=idx;
          });
        },
        currentIndex: index ,
        items: [
          BottomNavigationBarItem(title: Text('Grid List',style: TextStyle(color: appTheme.primaryColor),), icon: Icon(Icons.grid_on, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('List',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.line_weight, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('Form',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.library_books, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('Animation',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.play_circle_outline, color: appTheme.primaryColor,)),
        ],
      ),
      body: pages[index],
    );
  }
}

