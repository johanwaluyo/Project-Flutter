import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> with SingleTickerProviderStateMixin {
List<DropdownMenuItem<String>> listDropDown =[];
List<String> country=["Singapore","Indonesia","Malaysia"];
void loadData(){
  listDropDown =[];
  listDropDown = country.map((val) => new DropdownMenuItem<String>(
    child: new Text(val),value: val,)
  ).toList();
  /*
  listDropDown.add(new DropdownMenuItem(
    child: new Text("Malaysia"),
    value: "MY",
  ));
  listDropDown.add(new DropdownMenuItem(
    child: new Text("Indonesia"),
    value: "ID",
  ));
  listDropDown.add(new DropdownMenuItem(
    child: new Text("Singapore"),
    value: "SG",
  ));*/

}

int state = 0 ;
String dropDownVal=null;
  @override
  Widget build(BuildContext context) {
    loadData();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Form(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  border: InputBorder.none,
                  hintText: 'Please enter TextFormField'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ),
        ),
        Container(
          child: TextField(
                  decoration: InputDecoration(
                  labelText: "Address",
                  border: InputBorder.none,
                  hintText: 'Please enter TextField'
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              DropdownButton(
              value: dropDownVal,
              items: listDropDown,
              iconSize: 50.0,
              elevation: 16,
              hint: new Text("Select Country"),
              onChanged: (value) {
                dropDownVal = value;
                setState(() {
                  
                });
              },
            ),
            ],
          ),
        ),
        
        

      ],
    );
  }
}
