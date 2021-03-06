import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

enum DialogAction{
  yes,
  no,
  maybe
}


const TextStyle formTextStyle =TextStyle(color: Colors.white,fontSize: 16.0);

class _FormsState extends State<Forms> with SingleTickerProviderStateMixin {
  
  

List<DropdownMenuItem<String>> listDropDown =[];
List<String> country=["Singapore","Indonesia","Malaysia","Thailan","Cambodia","Vietnam","Japan","Korea"];
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

DateTime _date = new DateTime.now();
TimeOfDay _time = new TimeOfDay.now();
Future<Null> _selectedDate(BuildContext context) async{
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: _date,
    firstDate: new DateTime(2000),
    lastDate: new DateTime(2200), 
  );

  if (picked != null && picked !=_date) {
    print("Date Selected : ${_date.toString()}");
    setState(() {
     _date =picked; 
    });
  }

}

Future<Null> _selectedTime(BuildContext context) async{
  final TimeOfDay picked = await showTimePicker(
    context: context,
    initialTime: _time,
  );

  if (picked != null && picked !=_date) {
    print("Time Selected : ${_date.toString()}");
    setState(() {
     _time =picked; 
    });
  }

}

bool _switchValue = false;
void _onChangedSwitch(bool val){
  setState(() {
   _switchValue = val; 
  });
}

double _sliderValue = 0.0;
void _onChangeSlider(double val){
  setState(() {
   _sliderValue = val; 
  });
}


bool _checkboxValue = false;
void _onchangedCheckbox(bool val){
  setState(() {
   _checkboxValue = val; 
  });
}

int _groupVal;
void _onchangedRadio(int val){
  setState(() {
   if (val == 1) {
     _groupVal=1;
   } else if (val == 2) {
     _groupVal=2;     
   }
  });
}

int state = 0 ;
String dropDownVal=null;

var imageURLs = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Culinary_fruits_front_view.jpg/220px-Culinary_fruits_front_view.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Pineapple_and_cross_section.jpg/220px-Pineapple_and_cross_section.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Peanut_9417.jpg/220px-Peanut_9417.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Flower_garden_in_Ushuaia_%285542996965%29.jpg/220px-Flower_garden_in_Ushuaia_%285542996965%29.jpg'
];
var selectedImageIndex = 0;

String _isError='';
void _dialogResult(DialogAction val){
  print("You Selected $val");
  setState(() {
    switch (val) {
      case DialogAction.yes : _isError='yes';
      break;
      case DialogAction.no : _isError='no';
      break;
        
        break;
      default:
    }
     
  });
  Navigator.pop(context);
}

void _showAlert(String val){
  if (val.isEmpty)return;
  
  AlertDialog dialog =  new AlertDialog(
                          backgroundColor: Colors.lightGreen,
                          content: Text(val),
                          contentTextStyle: formTextStyle,
                          actions: <Widget>[
                            new FlatButton(onPressed: (){
                              _dialogResult(DialogAction.yes);
                            },child: new Text("Yes",style: formTextStyle),),
                            
                            new FlatButton(onPressed: (){
                              _dialogResult(DialogAction.no);
                            },child: new Text("No",style: formTextStyle),),
                            
                          ],
                        );
  showDialog(context: context,child: dialog);
}
String _textAlert = 'Error Alert Dialog';

String _answer = '';
void _setAnswer(String val){
  setState(() {
   _answer=val; 
  });
}
Future<Null> _askUser() async{
  switch (
    await showDialog(
      context: context ,
      child: new SimpleDialog(
        backgroundColor: Colors.lightGreen,
          title: new Text("Do you like This Tutorial ?",style: formTextStyle,),
          children: <Widget>[
            new SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context,DialogAction.yes);
              },
              child: const Text("Yes",style: formTextStyle),
            ),
            new SimpleDialogOption(
              onPressed: (){
                Navigator.pop(context,DialogAction.no);
              },
              child: const Text("No",style: formTextStyle),
            ),
          ],
      ),
      )
  ) {
    case DialogAction.yes : _setAnswer('yes');
      break;
    case DialogAction.no : _setAnswer('no');
      break;
    default:
  }
}



  @override
  Widget build(BuildContext context) {
    final _cachedImage = new CachedNetworkImage(
      placeholder: new CircularProgressIndicator(),
      imageUrl: imageURLs[selectedImageIndex],
      height: 300.0,
    );
    loadData();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: TextField(
                    decoration: InputDecoration(
                    labelText: "Name",
                    border: InputBorder.none,
                    hintText: 'Please enter TextField'
              ),
            ),
          ),
          Container(
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Address",
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
         Container(
           child: Column(
             children: <Widget>[
               new Column(
                 children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Text("Date Selected : ${_date.toString()}"),
                      new IconButton(
                        icon: Icon(Icons.date_range),
                        onPressed: (){
                        _selectedDate(context);
                          },
                      ),
                    ],
                  ),
                 ],
                 
               ),
               new Text(" "),
               new Column(
                 children: <Widget>[
                  Row(
                    children: <Widget>[
                      new Text("Time Selected : ${_time.toString()}"),
                      new IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: (){
                        _selectedTime(context);
                          },
                      ),
                    ],
                  ),
                 ],
               ),
             ],
           ),
         ),
          Container(
            child: Row(
              children: <Widget>[
                Text("On/Off"),
                Switch(
                  activeColor: Colors.lightGreen,
                  value: _switchValue,
                  onChanged: (bool val){
                    _onChangedSwitch(val);
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Slider"),
                    Slider(
                      label: "Slider",
                      value: _sliderValue,
                      onChanged: (double val){_onChangeSlider(val);},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: LinearProgressIndicator(
                      value: _sliderValue,
                      backgroundColor: Colors.lightGreen,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: CircularProgressIndicator(
                      value: _sliderValue,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Programming"), 
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.lightGreen,
                      value: _checkboxValue,
                      onChanged: (bool val){_onchangedCheckbox(val);},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Gender"),
                    Column(
                      children: <Widget>[
                        new Text("Male",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                        new Radio(
                          onChanged: (int val) =>_onchangedRadio(val),
                          value: 1,
                          groupValue: _groupVal,
                          activeColor: Colors.lightGreen,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        new Text("Female",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                        new Radio(
                          onChanged: (int val) =>_onchangedRadio(val),
                          value: 2,
                          groupValue: _groupVal,
                          activeColor: Colors.lightGreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        Container(
          child: Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new Center(
                    child: _cachedImage,
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new IconButton(
                        icon :new Icon(Icons.arrow_back),
                        onPressed: (){
                          setState(() {
                            selectedImageIndex=selectedImageIndex<=0?
                                                selectedImageIndex:selectedImageIndex-1;
                          });
                        }
                    )
                ),
                new Expanded(
                    child: new IconButton(
                        icon :new Icon(Icons.arrow_forward),
                        onPressed: (){
                          setState(() {
                            selectedImageIndex = (selectedImageIndex >= imageURLs.length - 1) ?
                                    selectedImageIndex : selectedImageIndex + 1;
                          });
                        }
                    )
                ),
              ],
            ),
        ),
       Container(
         child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Your AlertDialog : ${_isError}"),
                      IconButton(
                        icon: Icon(Icons.error),
                        onPressed: (){
                          _showAlert(_textAlert);
                        },
                      )
                    ],
                  ),
                ],
              ),
       ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                new Text("Your SimpleDialog : ${_answer}"),
                new IconButton(
                  icon: Icon(Icons.question_answer),
                  onPressed: (){
                    _askUser();
                  },
                )
              ],
            )
          ],
        )
        ],
      ),
    );
  }
}


