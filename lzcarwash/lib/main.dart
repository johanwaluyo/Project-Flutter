import 'package:flutter/material.dart';
import 'package:lzcarwash/pages/grid_listview.dart';
import 'package:lzcarwash/pages/tiles.dart';

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
    Container(color: Colors.lightBlue,),
    Container(color: Colors.orangeAccent,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.primaryColor,
        title: Text('lzCarWash',style: TextStyle(color: Colors.white),),
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
          BottomNavigationBarItem(title: Text('Home',style: TextStyle(color: appTheme.primaryColor),), icon: Icon(Icons.home, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('List',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.local_car_wash, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('Data',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.desktop_mac, color: appTheme.primaryColor,)),
          BottomNavigationBarItem(title: Text('Notification',style: TextStyle(color: appTheme.primaryColor),),icon: Icon(Icons.notifications, color: appTheme.primaryColor,)),
        ],
      ),
      body: pages[index],
    );
  }
}

