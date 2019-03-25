import 'package:flutter/material.dart';

class GridListView extends StatefulWidget {
  @override
  _GridListViewState createState() => _GridListViewState();
}

class _GridListViewState extends State<GridListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 120.0,
        children: <Widget>[
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img3.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img3.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img3.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img3.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img3.jpg'),
          Image.asset('assets/images/img2.jpg'),
          Image.asset('assets/images/img2.jpg'),
        ],
      ),
      );
  }
}