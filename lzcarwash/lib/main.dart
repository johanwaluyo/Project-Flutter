import 'package:flutter/material.dart';

//own library
import 'pages/pages.dart';

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
var _scaffoldKey = new GlobalKey<ScaffoldState>();
  String shackBarTextGlobal = '';
  void _onChangeSnackBar(String val){
    setState(() {
      shackBarTextGlobal=val; 
    });
  }
  void _showSnackBar(String val){
    if(val.isEmpty) return;
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(val,style: TextStyle(fontWeight: FontWeight.bold),),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.lightGreen,
        action: SnackBarAction(
          label: "Close",
          textColor: Colors.white,
          onPressed: (){
            print("Close press");
          },
        ),
      ),
    );
  }
  int index = 0 ;
  List<Widget> pages = [
    GridListView(),
    Tiles(),
    Forms(),
    Loader(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.info),onPressed: (){
            _showSnackBar("Snack Bar Text Here");
          },)
        ],
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

