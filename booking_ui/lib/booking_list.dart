import 'package:flutter/material.dart';
import 'package:booking/screens/CustomShaperClipper.dart';
import 'package:booking/main.dart';


final Color discountBackGroundColor = Colors.lightBlue;
final Color bookingBorderColor = Colors.lightBlue;
final Color chipBackGroundColor = Colors.white;

class BookingListing extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        title: Text("Search Result"),
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
                  BookingListTopPart(),
                  SizedBox(height: 20.0,),
                  BookingListBottomPart(),
                ],
              ),
      ),
    );
  }
}

class BookingListTopPart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    secondColor,
                    secondColor
                  ]),
            ),
            height: 160.0,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 22.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(location[0],style: TextStyle(fontSize: 16.0,),),
                          Divider(color: Colors.lightBlue,height: 20.0,),
                          Text(location[1],style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.import_export, color: Colors.black,size: 35.0,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class BookingListBottomPart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Best Deals for Next 6 Months", style: dropDownMenuItemStyle,),
          ),
          SizedBox(height: 10.0,),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              BookingCard(),
              BookingCard(),
              BookingCard(),
              BookingCard(),
              BookingCard(),
              BookingCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            height: 110.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0),),
              border: Border.all(color: bookingBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('${formatCurrency.format(4000)}', 
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,)
                      ),
                      SizedBox(width: 4.0,),
                      Text('${formatCurrency.format(4999)}', 
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 20.0,decoration:TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 7.0,
                    children: <Widget>[
                      BookingDetailChip(Icons.calendar_today,'June 2019'),
                      BookingDetailChip(Icons.directions_boat,'Batam Jet'),
                      BookingDetailChip(Icons.star,'4.2'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10.0,
            right: 0.0,

            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
              child: Text("55%",style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.bold ),
              ),
              decoration: BoxDecoration(
                color: discountBackGroundColor,
                borderRadius: BorderRadius.all(Radius.circular(50.0),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingDetailChip extends StatelessWidget{

  final IconData iconData;
  final String label;

  BookingDetailChip(this.iconData,this.label);

  @override
  Widget build(BuildContext context){
    return RawChip(
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black,fontSize: 14.0,),
      backgroundColor: chipBackGroundColor,
      avatar: Icon(iconData,size: 14.0,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)) ,
      ),
    );

  }
}