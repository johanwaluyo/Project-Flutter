import 'package:flutter/material.dart';
import 'package:booking/main.dart';

class CustomAppBar extends StatelessWidget{
  final List<BottomNavigationBarItem> bottomBarItems = [];
  int index=0;
  final bottomNavigationBarItemStyle =TextStyle( fontStyle: FontStyle.normal,color: Colors.black);

  CustomAppBar(){
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.lightBlue,),
        title: Text("Explore",style: TextStyle(color: Colors.lightBlue),),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite,color: Colors.lightBlue,),
        title: Text("WatchList",style: TextStyle(color: Colors.lightBlue),),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer,color: Colors.lightBlue,),
        title: Text("Deals",style: TextStyle(color: Colors.lightBlue),),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications,color: Colors.lightBlue,),
        title: Text("Notification",style: TextStyle(color: Colors.lightBlue),),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Material(
        elevation: 15.0,
        child: BottomNavigationBar(
          onTap: (int idx){
            index=idx;
          } ,
          currentIndex: index,
          items: bottomBarItems,
          type: BottomNavigationBarType.shifting,
      ),
    );
  }
}