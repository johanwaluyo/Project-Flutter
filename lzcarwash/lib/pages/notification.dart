import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Notifications"),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  NotificationListTopPart(),
                  SizedBox(height: 20.0,),
                  NotificationBottomPart(),
                ],
              ),
      ),
    );
  }
}


class NotificationListTopPart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightGreen,
                    Colors.lightGreen
                  ]),
            ),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            
          ],
        ),
      ],
    );
  }
}


class NotificationBottomPart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("All Notifications", ),
          ),
          SizedBox(height: 10.0,),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              
            ],
          ),
        ],
      ),
    );
  }
}