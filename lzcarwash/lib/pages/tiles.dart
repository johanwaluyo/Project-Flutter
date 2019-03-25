import 'package:flutter/material.dart';

class MyTile{
  String title;
  List<MyTile> children;
  MyTile(this.title,[this.children =const <MyTile>[]]);
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          subtitle: new Text("Subtitle"),
          leading: new Text("Leading"),
          selected: true,
          trailing: new Text("trailing"),
          title: new Text(t.title));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}


class Tiles extends StatefulWidget {
  @override
  _TilesState createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return new StuffInTiles(listOfTiles[index]);
            },
            itemCount: listOfTiles.length,
          ),
    );
}}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Computer',
    <MyTile>[
    new MyTile(
      'Software',
      <MyTile>[
        new MyTile('Java'),
        new MyTile('C++'),
        new MyTile('.NET'),
      ],
    ),
    new MyTile('Hardware')
  ]
  ),
  new MyTile(
    'Cars',
    <MyTile>[
      new MyTile('Tesla'),
      new MyTile('Toyota'),
    ],
  ),
];