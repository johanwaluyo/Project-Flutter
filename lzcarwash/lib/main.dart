import 'package:flutter/material.dart';
import 'package:lzcarwash/pages/grid_listview.dart';
import 'package:lzcarwash/pages/tiles.dart';
import 'package:lzcarwash/pages/form.dart';
import 'package:lzcarwash/pages/loading.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

