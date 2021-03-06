import 'package:flutter/material.dart';
import 'package:booking/screens/CustomAppBar.dart';
import 'package:booking/screens/CustomShaperClipper.dart';
import 'package:booking/booking_list.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
  title: 'Booking UI',
  debugShowCheckedModeBanner: false,
  home: HomeScreen(),
  theme: appTheme,
));

ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue[400],
  fontFamily: 'Oxygen'
);

int menuItemNo = 0;
List<String> location = ['Tg Balai Karimun (TBK)','Batam (BTM)'];


class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
              children: <Widget>[
                HomeScreenTopPart(),
                HomeScreenBottomPart,
                HomeScreenBottomPart,
            ],
          ),
      ),
      /*
        ListView(
          scrollDirection: Axis.vertical,
          
          children:[
            HomeScreenTopPart(),
            HomeScreenBottomPart,
          ],
        ), 
      */
    );
  }
}

const TextStyle dropDownLabelStyle =TextStyle(color: Colors.white,fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =TextStyle(color: Colors.black,fontSize: 16.0);
final Color firstColor = Colors.blue[300];
final Color secondColor = Colors.blue[400];

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
var selectedLocationIndex = 0;
var isFlightSelected = true;

  @override
  Widget build(BuildContext context){
    return Stack(
        children: <Widget>[
           ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: 330.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    firstColor,
                    secondColor
                  ])
                ),
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.location_on,color: Colors.white,),
                          SizedBox(width: 16.0,),
                          PopupMenuButton(
                            onSelected: (index){
                              setState(() {
                                selectedLocationIndex = index;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(location[selectedLocationIndex],style: dropDownLabelStyle,),
                                Icon(Icons.keyboard_arrow_down,color: Colors.white,)
                              ],
                            ),
                            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                              
                              PopupMenuItem(
                                child: Text(location[0],style: dropDownMenuItemStyle,),
                                value: 0,     
                              ),
                              PopupMenuItem(
                                child: Text(location[1],style: dropDownMenuItemStyle,),
                                value: 1,     
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.settings, color: Colors.white,),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text("Where would\nyou want to go",
                      style: TextStyle(fontSize: 24.0,color: Colors.white,),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0),),
                          child: TextField(
                            controller: TextEditingController(text : location[1]),
                            style: dropDownMenuItemStyle,
                            cursorColor: appTheme.primaryColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                              suffixIcon: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context, 
                                      MaterialPageRoute(
                                        builder: (context) => BookingListing()
                                      )
                                    );
                                  },
                                  child: Icon(Icons.search,color: Colors.black,),
                                  ),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                          InkWell(
                            child: 
                              ChoiceChip(Icons.directions_boat,"Ferry",isFlightSelected),
                              onTap: (){
                                setState(() {
                                  isFlightSelected =true;
                                });
                              },
                          ),
                          SizedBox(width: 20.0,),
                          InkWell(
                            child: 
                              ChoiceChip(Icons.hotel,"Hotel",!isFlightSelected),
                              onTap: (){
                                setState(() {
                                  isFlightSelected =false;
                                });
                              },
                            ),
                      ],
                    ),
                  ],
              ),),
           ),
        ],
    );
  }
}


class ChoiceChip extends StatefulWidget{

  final IconData icon;
  final String text;
  final bool isSelected;
  
  ChoiceChip(this.icon,this.text,this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0 ),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

}

var viewAllStyle =TextStyle(fontSize: 14.0,color: appTheme.primaryColor );

var HomeScreenBottomPart = Column(
  children: <Widget>[
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16.0),
  child: Row(
      mainAxisSize : MainAxisSize.max,
      mainAxisAlignment : MainAxisAlignment.spaceBetween, 
      children: <Widget>[
        Text("Currently watched Items", style: dropDownMenuItemStyle,),
        Spacer(),
        Text("VIEW ALL (12)", style: viewAllStyle,),

      ],
    ),
  ),
  Container(
    height: 210.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: cityCards
    ),
  )
],
);

List<CityCard> cityCards = [
  CityCard("assets/images/img1.jpg", "Batam", "Feb 2019", "60", 2000000, 900000),
  CityCard("assets/images/img2.jpg", "Baloi", "Mar 2019", "45", 1500000, 800000),
  CityCard("assets/images/img3.jpg", "Rempang", "Jul 2019", "35", 1250000, 750000),
];

final formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount;
  final int oldPrice, newPrice;
  
  CityCard(this.imagePath,this.cityName, this.monthYear,
   this.discount, this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
              ),
              child: Stack(
              children: <Widget>[
                Container(
                  height: 190.0,
                  width: 160.0,
                  child: Image.asset(imagePath, fit: BoxFit.cover,),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors:[Colors.black,Colors.black.withOpacity(0.1)]
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cityName,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0,),),
                          Text(monthYear,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 14.0,),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                        ),
                        child: Text("$discount%",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 14.0,),)
                        ),
                      ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(newPrice)}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.0,),
              Text("(${formatCurrency.format(oldPrice)})",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
            ],
          ),

        ],
      ),
    );
  }
}